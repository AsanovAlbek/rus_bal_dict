import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rus_bal_dict/core/widgets/word_loading_list_item.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_bloc.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_event.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_state.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_event.dart';

import '../../../../core/model/word.dart';

class WordsListContent extends StatelessWidget {
  final List<Word> words;
  final int page;
  final int pageSize;
  final int wordsTotalCount;
  final PagingController<int, Word> pagingController;

  const WordsListContent(
      {super.key,
      required this.words,
      required this.page,
      required this.pageSize,
      required this.wordsTotalCount,
      required this.pagingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Найдено слов:$wordsTotalCount'),
        const SizedBox(height: 8),
        Expanded(
            child: RefreshIndicator(
          onRefresh: () {
            return Future.sync(() => pagingController.refresh());
          },
          child: PagedListView<int, Word>.separated(
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                  animateTransitions: true,
                  transitionDuration: const Duration(milliseconds: 500),
                  itemBuilder: (context, item, index) => ListTile(
                      title: GestureDetector(
                          onTap: () => context.go('/word_detail', extra: item), child: Text(item.word))),
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: 4)),
        ))
      ],
    );
  }
}
