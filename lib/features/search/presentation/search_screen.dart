import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/core_providers.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../../library/domain/watch_status.dart';
import 'search_providers.dart';
import 'widgets/anime_detail_sheet.dart';
import 'widgets/search_result_card.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  Timer? _debounce;
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  String _query = '';

  static const _searchTabIndex = 1;

  String _friendlyErrorMessage(Object error, AnimeSource source) {
    final sourceName = source == AnimeSource.jikan ? 'MAL' : 'AniList';
    return "Couldn't reach $sourceName. Check your connection.";
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    _query = value;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchProvider.notifier).search(value);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(currentTabProvider, (previous, next) {
      if (next == _searchTabIndex) {
        _searchFocusNode.requestFocus();
      }
    });

    final searchAsync = ref.watch(searchProvider);
    final notifier = ref.watch(searchProvider.notifier);
    final source = notifier.selectedSource;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Search Anime')),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: CupertinoSearchTextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                placeholder: 'Search anime title',
                autofocus: true,
                onChanged: _onQueryChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoSlidingSegmentedControl<AnimeSource>(
                groupValue: source,
                children: const {
                  AnimeSource.jikan: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('MAL'),
                  ),
                  AnimeSource.anilist: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('AniList'),
                  ),
                },
                onValueChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  ref.read(searchProvider.notifier).setSource(value);
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: searchAsync.when(
                data: (results) {
                  if (_query.trim().isEmpty) {
                    return const EmptyState(
                      icon: CupertinoIcons.search,
                      message: 'Search for anime to add to your library',
                    );
                  }

                  if (results.isEmpty) {
                    return const EmptyState(
                      icon: CupertinoIcons.search_circle,
                      message: 'No results found. Try a different title.',
                    );
                  }

                  return Column(
                    children: [
                      if (notifier.showingCachedResults)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemOrange.withValues(
                              alpha: 0.15,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Offline • Showing cached results',
                            style: TextStyle(
                              color: CupertinoColors.systemOrange,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      Expanded(
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            if (notification.metrics.pixels >=
                                notification.metrics.maxScrollExtent - 200) {
                              ref.read(searchProvider.notifier).loadMore();
                            }
                            return false;
                          },
                          child: ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            itemCount: results.length + 1,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              if (index == results.length) {
                                if (notifier.isLoadingMore) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Center(
                                      child: CupertinoActivityIndicator(),
                                    ),
                                  );
                                }
                                if (!notifier.hasNextPage) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Center(
                                      child: Text(
                                        'No more results',
                                        style: TextStyle(
                                          color: CupertinoColors.systemGrey,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              }

                              final result = results[index];
                              return SearchResultCard(
                                result: result,
                                onTap: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) =>
                                          AnimeDetailSheet(result: result),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
                loading: () {
                  if (_query.trim().isEmpty) {
                    return const EmptyState(
                      icon: CupertinoIcons.search,
                      message: 'Search for anime to add to your library',
                    );
                  }
                  return const LoadingIndicator();
                },
                error: (error, stack) => ErrorState(
                  message: _friendlyErrorMessage(error, source),
                  onRetry: () {
                    ref.read(searchProvider.notifier).search(_query);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
