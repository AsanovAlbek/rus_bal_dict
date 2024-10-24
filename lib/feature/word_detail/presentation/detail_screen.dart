import 'detail.dart';

class WordsDetailScreen extends StatefulWidget {
  final Word? word;

  const WordsDetailScreen({super.key, this.word});

  @override
  State<WordsDetailScreen> createState() => _WordsDetailScreenState();
}

class _WordsDetailScreenState extends State<WordsDetailScreen> {
  final AudioPlayer player = GetIt.I<AudioPlayer>();

  @override
  void initState() {
    if (mounted && widget.word != null) {
      context
          .read<HistoryBloc>()
          .add(HistoryEvent.addToHistory(word: widget.word!));
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          context.pop();
        },
        child: ValueListenableBuilder(
          valueListenable:
              Hive.box<FavoriteWordHiveModel>('favorites').listenable(),
          builder: (BuildContext context, Box<FavoriteWordHiveModel> value,
              Widget? child) {
            return BlocProvider(
              create: (context) => DetailBloc(GetIt.I<DetailRepository>())
                ..add(GetAudioEvent(widget.word?.audioUrl)),
              child: BlocBuilder<DetailBloc, DetailState>(
                builder: (context, state) {
                  final favoritesState = context.read<FavoritesBloc>().state;
                  if (favoritesState is FavoritesStateLoaded) {
                    context.read<DetailBloc>().add(ChangeFavoriteEvent(
                        favoritesState.favorites.contains(widget.word)));
                  }
                  return switch (state) {
                    DetailStateLoaded() => DetailContent(
                        favoritesBox: value,
                        word: widget.word,
                        playAudio: () => _playMusic(bytes: state.bytes),
                      ),
                    DetailStateError(exception: final exception) =>
                      Center(child: Text('$exception')),
                    DetailStateLoading() =>
                      const Center(child: CircularProgressIndicator()),
                  };
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _playMusic({Uint8List? bytes}) {
    Source? audioSource;
    if (bytes != null) {
      audioSource = BytesSource(bytes);
    }
    if (audioSource != null) {
      if (player.state == PlayerState.playing) {
        player.stop();
      } else {
        player.setSource(audioSource);
        player.play(audioSource);
      }
    }
    Talker().debug('bytes = $bytes source = $audioSource');
  }
}

class DetailContent extends StatelessWidget {
  final Function()? playAudio;
  final Word? word;
  final Box<FavoriteWordHiveModel> favoritesBox;

  const DetailContent(
      {super.key, this.playAudio, this.word, required this.favoritesBox});

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color ?? Colors.black;
    return CustomScrollView(controller: ScrollController(), slivers: [
      MyAppBar(
        title: word?.word.toCapitalized() ?? '',
        actions: [
          IconButton(
              onPressed: playAudio,
              icon: SvgPicture.asset(
                'assets/images/play_audio.svg',
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              )),
          FavoritesIconButton(
            isFavorite: Hive.box<FavoriteWordHiveModel>('favorites')
                .containsKey(word?.id ?? 0),
            onPressed: () {
              if (word != null) {
                int wordId = word?.id ?? 0;
                if (favoritesBox.containsKey(wordId)) {
                  favoritesBox.delete(wordId);
                } else {
                  int userId = context
                          .read<ProfileCubit>()
                          .state
                          .appSettings
                          .userInfo
                          .id ??
                      0;
                  favoritesBox.put(
                      wordId, word!.toFavoritesHive(userId: userId));
                }
                //context.read<WordsListBloc>().add(WordsListEvent.fetch());
              }
            },
          )
        ],
      ),
      const SizedBox(height: 12).asSliver,
      SliverPadding(
          padding: const EdgeInsets.all(12),
          sliver: Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: HtmlWidget("${word?.meaning.toCapitalized()}"),
          )).asSliver)
    ]);
  }
}
