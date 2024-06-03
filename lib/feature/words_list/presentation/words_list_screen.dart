import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/core/widgets/word_list_item.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_bloc.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_event.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_state.dart';
import 'package:talker/talker.dart';

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
        context
            .read<WordsListBloc>()
            .add(WordsListEvent.changeScrollableUp(canScroll: _scrollController.position.extentBefore > 500));
        if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
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

  void fetch({String? query}) {
    Talker().debug('fetch');
    context.read<WordsListBloc>().add(WordsListEvent.fetch(query: query));
  }

  void _animateScrollToTop() {
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void _jumpToTop() {
    _scrollController.jumpTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordsListBloc, WordsListState>(
      builder: (context, state) {
        final bloc = context.read<WordsListBloc>();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: () {
              return Future.sync(() {
                fetch();
              });
            },
            child: Stack(children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(24),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.search),
                              labelText: 'Поиск слова'),
                          onChanged: (text) {
                            AppUtils.debounce(() {
                              _animateScrollToTop();
                              fetch(query: _searchController.text.trim());
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  if (state is WordsListStateLoaded)
                    SliverPadding(
                        padding: const EdgeInsets.all(8),
                        sliver: Text(
                          'Найдено слов: ${state.totalWordsCount}',
                          textAlign: TextAlign.center,
                        ).asSliver),
                  switch (state) {
                    WordsListStateLoading() => const SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    WordsListStateLoaded(
                      words: final words,
                      totalWordsCount: final totalWordsCount) =>
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (index == words.length && words.length < totalWordsCount) {
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
                                context.go('/word_list/word_detail', extra: word);
                              },
                            );
                          },
                          childCount: words.length < totalWordsCount ? words.length + 1 : words.length,
                        ),
                      ),
                    WordsListStateError(message: final msg) => SliverFillRemaining(
                        child: Center(child: Text('$msg')),
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
          ),
        );
      },
    );
  }
}
