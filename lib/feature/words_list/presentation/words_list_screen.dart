import 'words_list.dart';

class WordsListScreen extends StatefulWidget {
  const WordsListScreen({super.key});

  @override
  State<WordsListScreen> createState() => _WordsListScreenState();
}

class _WordsListScreenState extends State<WordsListScreen> {
  final di = GetIt.instance;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    if (mounted) {
      //fetch();
      _scrollController.addListener(() {
        final position = _scrollController.position;
        context.read<WordsListBloc>().add(WordsListEvent.changeScrollableUp(
            canScroll: position.extentBefore > 500 &&
                position.userScrollDirection == ScrollDirection.forward));
        if (position.maxScrollExtent == position.pixels) {
          fetch();
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void fetch({String? query, Completer? completer}) {
    Talker().debug('fetch');
    context
        .read<WordsListBloc>()
        .add(WordsListEvent.fetch(query: query, completer: completer));
  }

  void _animateScrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void _jumpToTop() {
    _scrollController.jumpTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordsListBloc, WordsListState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () {
            Completer completer = Completer();
            fetch(completer: completer);
            return completer.future;
          },
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                MyAppBar(
                  title: 'РУССКО - БАЛКАРСКИЙ СЛОВАРЬ',
                  showSearchField: true,
                  searchController: _searchController,
                  onTextEditing: (text) {
                    // _animateScrollToTop();
                    // fetch(query: _searchController.text.trim());
                    AppUtils.debounce(() {
                      _animateScrollToTop();
                      fetch(query: _searchController.text.trim());
                    });
                  },
                ),
                switch (state) {
                  WordsListStateLoading() => const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  WordsListStateLoaded(
                    words: final words,
                    totalWordsCount: final totalWordsCount
                  ) =>
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (words.length < totalWordsCount &&
                                index == words.length) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            return WordListItem(
                                word: words[index],
                                onPressed: (word) {
                                  // Если у поисковой строки фокус и происходит переход к слову
                                  // То после возврата фокус остаётся и открывается клавиатура
                                  // Воизбежание такого поведения отнимаем фокус у поля
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  context.go('/word_list/word_detail',
                                      extra: word);
                                },
                                saveEnable: false,
                                onSaveWord: (word) {
                                  context.read<FavoritesBloc>().add(
                                      FavoritesEvent.addToFavorites(
                                          word: word));
                                },
                                isFavorite:
                                    Hive.box<FavoriteWordHiveModel>('favorites')
                                        .containsKey(words[index].id));
                          },
                          childCount: words.length < totalWordsCount
                              ? words.length + 1
                              : words.length,
                        ),
                      ),
                    ),
                  WordsListStateError(message: final msg) =>
                    SliverFillRemaining(
                      child: Center(child: Text('$msg')),
                    ),
                  // TODO: Handle this case.
                  WordsListStateEmpty(message: final message) =>
                    SliverFillRemaining(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                },
              ],
            ),
            if (state is WordsListStateLoaded && state.canScrollUp)
              Positioned(
                bottom: 24,
                right: 24,
                child: FloatingActionButton(
                  onPressed: _jumpToTop,
                  child: const Icon(Icons.arrow_upward),
                ),
              )
          ]),
        );
      },
    );
  }
}
