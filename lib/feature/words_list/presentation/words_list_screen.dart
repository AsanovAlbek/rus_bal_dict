import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
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
        if (0.8 * _scrollController.position.maxScrollExtent < _scrollController.position.pixels) {
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

  void fetch({String? query, int? page}) {
    Talker().debug('fetch');
    context.read<WordsListBloc>().add(WordsListEvent.fetch(
        query: query,
        page: page,
        onSuccess: (words, total) {
          bool isLastPage = words.length < 100;
        }));
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
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Поиск слова'),
              onChanged: (text) {
                AppUtils.debounce(() => fetch(query: _searchController.text.trim()));
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
                totalWordsCount: final totalWordsCount,
                ) =>
                    Stack(
                        children: [
                          Column(
                            children: [
                              Text('Найдено слов:$totalWordsCount'),
                              const SizedBox(height: 8),
                              Expanded(
                                child: RefreshIndicator(
                                  onRefresh: () {
                                    return Future.sync(() => fetch(page: 0));
                                  },
                                  child: words.isNotEmpty
                                      ? Scrollbar(
                                    controller: _scrollController,
                                    thumbVisibility: true,
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        // if (index == words.length) {
                                        //   return const Center(
                                        //       child: Padding(
                                        //           padding: EdgeInsets.all(8), child: CircularProgressIndicator()));
                                        // }
                                        return ListTile(
                                            onTap: () => context.go('/word_list/word_detail', extra: words[index]),
                                            title: Text(words[index].word));
                                      },
                                      separatorBuilder: (context, index) => const SizedBox(height: 4),
                                      itemCount: words.length,
                                      controller: _scrollController,
                                    ),
                                  )
                                      : const Center(child: Text('Пусто')),
                                ),
                              )
                            ],
                          ),
                        ]
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
