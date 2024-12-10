import 'package:rus_bal_dict/export.dart';

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
                  title: 'БАЛКАРО - РУССКИЙ СЛОВАРЬ',
                  showSearchField: true,
                  searchController: _searchController,
                  onTextEditing: (text) {
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
                                onPressed: (word) async {
                                  final profileCubit =
                                      context.read<ProfileCubit>();
                                  //await profileCubit.checkLimits();
                                  final premiumInfo =
                                      profileCubit.state.paymentInfo;
                                  Talker().debug('PREM INFO = $premiumInfo');
                                  if (!premiumInfo.isSubscribe) {
                                    Talker().debug(
                                        'Minus one free try. tries = ${premiumInfo.dayLimit}');
                                  }
                                  // Если пользователь без подписки и его попытки кончились
                                  if (!premiumInfo.isSubscribe &&
                                      premiumInfo.dayLimit <= 0) {
                                    Future.sync(() =>
                                        showFreeTriesReachLimitDialog(context));
                                  } else {
                                    // Если у поисковой строки фокус и происходит переход к слову
                                    // То после возврата фокус остаётся и открывается клавиатура
                                    // Воизбежание такого поведения отнимаем фокус у поля
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    Future.sync(() => context.go(
                                        '/word_list/word_detail',
                                        extra: word));
                                  }
                                  await profileCubit.checkLimits();
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

  void showFreeTriesReachLimitDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('У вас закончились бесплатные просмотры слов'),
            content: const Text(
                'Оформите подписку чтобы пользоваться словарем без ограничений'),
            actions: [
              TextButton(
                onPressed: () async {
                  await context.read<ProfileCubit>().fetchUserPaymentInfo(() {
                    context.go('/profile/premium');
                    Navigator.of(dialogContext).pop();
                  });
                },
                child: const Text('Оформить подписку'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('Ок'),
              ),
            ],
          );
        });
  }
}
