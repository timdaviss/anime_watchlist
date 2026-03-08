import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/core_providers.dart';
import '../../favorites/presentation/favorites_screen.dart';
import '../../library/presentation/library_screen.dart';
import '../../search/presentation/search_screen.dart';
import '../../statistics/statistics.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _tabController = CupertinoTabController();

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      ref.read(currentTabProvider.notifier).setIndex(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chart_bar),
            label: 'Stats',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return switch (index) {
              0 => const LibraryScreen(),
              1 => const SearchScreen(),
              2 => const FavoritesScreen(),
              _ => const StatisticsScreen(),
            };
          },
        );
      },
    );
  }
}
