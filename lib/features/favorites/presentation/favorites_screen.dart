import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_indicator.dart';
import 'favorites_providers.dart';
import 'widgets/favorite_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Favorites')),
      child: SafeArea(
        child: favoritesAsync.when(
          data: (favorites) {
            if (favorites.isEmpty) {
              return const EmptyState(
                icon: CupertinoIcons.heart,
                message:
                    'No favorites yet. Tap the heart on any anime to add it here.',
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return FavoriteCard(anime: favorites[index]);
                },
              ),
            );
          },
          loading: () => const LoadingIndicator(),
          error: (error, stack) => ErrorState(
            message: error.toString(),
            onRetry: () => ref.invalidate(favoritesProvider),
          ),
        ),
      ),
    );
  }
}
