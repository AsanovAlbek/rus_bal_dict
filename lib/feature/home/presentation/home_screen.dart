import 'home.dart';

class HomeScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({super.key, required this.navigationShell});

  void _onSelectNavBar(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              WordsListBloc(repository: GetIt.I<WordsListRepository>())
                ..add(WordsListEvent.fetch()),
        ),
        BlocProvider(
            create: (context) => HistoryBloc(GetIt.I<
                HistoryRepository>())), //..add(HistoryEvent.getHistory())),
        BlocProvider(
            create: (context) => FavoritesBloc(
                GetIt.I<FavoritesRepository>())) //..add(FavoritesEvent.load()))
      ], child: navigationShell),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 32), label: 'Главная'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/favorites.svg',
                colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color ?? Colors.black,
                    BlendMode.srcIn),
              ),
              label: 'Избранное'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.history, size: 32), label: 'Недавние'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 32), label: 'Профиль')
        ],
        onTap: _onSelectNavBar,
      ),
    );
  }
}
