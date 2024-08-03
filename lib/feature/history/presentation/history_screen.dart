import 'history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<WordHiveModel>('history').listenable(),
      builder: (BuildContext context, Box<WordHiveModel> box, Widget? child) {
        var wordsFromHistory = box.values
            .where((word) => word.userId == (context.read<ProfileCubit>().state.appSettings.userInfo.id ?? 0))
            .toList();
        wordsFromHistory.sort((word, next) {
            return next.createTime.compareTo(word.createTime);
          });
        final words = wordsFromHistory.map((hiveModel) => hiveModel.toModel()).toList();
        for (final fromHistory in wordsFromHistory) {
          Talker().debug('word ${fromHistory.word} created millis ${fromHistory.createTime}');
        }
        return CustomScrollView(
          slivers: [
            MyAppBar(
              title: 'История',
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
                return WordListItem(
                  word: words[index],
                  onPressed: (word) => context.go('/history/word_detail', extra: word),
                );
              }, childCount: words.length))
            else
              const SliverToBoxAdapter(child: Center(child: Text('Здесь пока ничего нет')))
          ],
        );
      },
    );
  }
}
