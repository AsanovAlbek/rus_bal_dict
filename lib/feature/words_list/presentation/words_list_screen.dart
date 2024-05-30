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

  //bool canAnimateUp = false;

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
    context.read<WordsListBloc>().add(WordsListEvent.fetch(
        query: query,
        onSuccess: (words, total) {
          bool isLastPage = words.length < 100;
        }));
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
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            TextField(
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
            Expanded(
              child: switch (state) {
                WordsListStateLoading() => const Center(child: CircularProgressIndicator()),
                WordsListStateLoaded(
                words: final words,
                itemsCount: final itemsCount,
                currentPage: final page,
                isLastPage: final isLastPage,
                canScrollUp: final canScrollUp,
                totalWordsCount: final totalWordsCount,
                ) =>
                    Scrollbar(
                      trackVisibility: true,
                      controller: _scrollController,
                      child: Stack(children: [
                        Column(
                          children: [
                            Text('Найдено слов:$totalWordsCount'),
                            const SizedBox(height: 8),
                            Expanded(
                              child: RefreshIndicator(
                                onRefresh: () {
                                  return Future.sync(() => fetch());
                                },
                                child: words.isNotEmpty
                                    ? ListView(
                                  controller: _scrollController,
                                  children: [
                                      for (var word in words) ...[
                                        WordListItem(word: word,
                                            onPressed: (word) =>
                                                context.go('/word_list/word_detail', extra: word))
                                      ],
                                  if (words.length < totalWordsCount) const Center(
                                      child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: CircularProgressIndicator()))
                                ],)
                                // ? ListView.separated(
                                //     itemBuilder: (context, index) {
                                //       if (index == words.length && words.length <= totalWordsCount) {
                                //         return const Center(
                                //             child: Padding(
                                //                 padding: EdgeInsets.all(8),
                                //                 child: CircularProgressIndicator()));
                                //       }
                                //       return WordListItem(
                                //         word: words[index],
                                //         onPressed: (word) =>
                                //             context.go('/word_list/word_detail', extra: word),
                                //       );
                                //     },
                                //     separatorBuilder: (context, index) => const SizedBox(height: 4),
                                //     itemCount:
                                //         words.length < totalWordsCount ? words.length + 1 : words.length,
                                //     controller: _scrollController,
                                //   )
                                    : const Center(child: Text('Пусто')),
                              ),
                            )
                          ],
                        ),
                        if (canScrollUp)
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
                WordsListStateError(message: final msg) => Center(child: Text('$msg'))
              },
            ),
          ]),
        );
      },
    );
  }
}