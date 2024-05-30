import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rus_bal_dict/core/hive/word/converter.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_bloc.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_event.dart';

import '../../../core/hive/word/word_hive_model.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<WordHiveModel>('history').listenable(),
      builder: (BuildContext context, Box<WordHiveModel> box, Widget? child) {
        final wordsFromHistory = box.values.toList()
          ..sort((word, next) => next.createTime.compareTo(word.createTime));
        final words = wordsFromHistory.map((hiveModel) => hiveModel.toModel()).toList();
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('История поиска',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20)),
              actions: [
                ElevatedButton.icon(
                    onPressed: () => context.read<HistoryBloc>().add(HistoryEvent.clearHistory()),
                    label: const Text('Удалить историю'),
                    icon: const Icon(Icons.delete_forever))
              ],
            ),
            if (words.isNotEmpty)
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                    onTap: () => context.go('/history/word_detail', extra: words[index]),
                    title: Text(words[index].word));
              }, childCount: words.length))
            else const SliverToBoxAdapter(child: Center(child: Text('Здесь пока ничего нет')))
          ],
        );
      },
    );
  }
}
