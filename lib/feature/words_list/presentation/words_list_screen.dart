import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        CircularProgressIndicator,
        Curves,
        CustomScrollView,
        EdgeInsets,
        FloatingActionButton,
        FocusManager,
        Icon,
        Icons,
        Padding,
        Positioned,
        RefreshIndicator,
        ScrollController,
        SliverChildBuilderDelegate,
        SliverFillRemaining,
        SliverList,
        SliverPadding,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextEditingController,
        Widget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/core/widgets/word_list_item.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_bloc.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_event.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_bloc.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_event.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_state.dart';
import 'package:talker/talker.dart';
import 'package:flutter/rendering.dart' show EdgeInsets, ScrollDirection;

import '../../../core/hive/favorite_word/favorite_word_hive_model.dart';
import '../../../core/utils/app_utils.dart';

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
        context.read<WordsListBloc>().add(WordsListEvent.changeScrollableUp(
            canScroll: _scrollController.position.extentBefore > 500 &&
                _scrollController.position.userScrollDirection == ScrollDirection.forward));
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
        return RefreshIndicator(
          onRefresh: () {
            return Future.sync(() {
              fetch();
            });
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
                  WordsListStateLoaded(words: final words, totalWordsCount: final totalWordsCount) =>
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (words.length < totalWordsCount && index == words.length) {
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
                                saveEnable: false,
                                onSaveWord: (word) {
                                  context
                                      .read<FavoritesBloc>()
                                      .add(FavoritesEvent.addToFavorites(word: word));
                                },
                                isFavorite: Hive.box<FavoriteWordHiveModel>('favorites')
                                    .containsKey(words[index].id));
                          },
                          childCount: words.length < totalWordsCount ? words.length + 1 : words.length,
                        ),
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
        );
      },
    );
  }
}
