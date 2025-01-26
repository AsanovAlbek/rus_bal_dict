import 'package:equatable/equatable.dart';

import '../../../../core/model/word/suggest_word.dart';

sealed class SuggestState {}

class SuggestStateLoading extends SuggestState {}

class SuggestStateLoaded extends SuggestState with EquatableMixin {
  final List<SuggestWord> userSuggests;
  final int itemsCount;
  final int currentPage;
  final String query;
  final bool isLastPage;
  final int totalWordsCount;
  final bool canScrollUp;

  SuggestStateLoaded(
      {this.userSuggests = const <SuggestWord>[],
      this.itemsCount = 0,
      this.currentPage = 0,
      this.query = '',
      this.isLastPage = false,
      this.totalWordsCount = 0,
      this.canScrollUp = false});

  @override
  List<Object?> get props => [
        userSuggests,
        itemsCount,
        currentPage,
        query,
        isLastPage,
        totalWordsCount,
        canScrollUp
      ];

  SuggestStateLoaded copyWith({
    List<SuggestWord>? userSuggests,
    int? itemsCount,
    int? currentPage,
    String? query,
    bool? isLastPage,
    int? totalWordsCount,
    bool? canScrollUp,
  }) {
    return SuggestStateLoaded(
      userSuggests: userSuggests ?? this.userSuggests,
      itemsCount: itemsCount ?? this.itemsCount,
      currentPage: currentPage ?? this.currentPage,
      query: query ?? this.query,
      isLastPage: isLastPage ?? this.isLastPage,
      totalWordsCount: totalWordsCount ?? this.totalWordsCount,
      canScrollUp: canScrollUp ?? this.canScrollUp,
    );
  }
}

class SuggestStateError extends SuggestState {
  final String message;
  SuggestStateError(this.message);
}

class SuggestStateEmpty extends SuggestState {
  final String message;
  SuggestStateEmpty({this.message = 'Ничего не найдено'});
}
