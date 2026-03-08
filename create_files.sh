#!/bin/bash
mkdir -p lib/shared/utils
mkdir -p lib/shared/widgets
mkdir -p lib/features/home/presentation
mkdir -p lib/features/library/presentation/widgets

cat << 'INNER_EOF' > lib/shared/utils/date_formatter.dart
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('MMM d, yyyy').format(date);
}
INNER_EOF

cat << 'INNER_EOF' > lib/shared/widgets/empty_state.dart
import 'package:flutter/cupertino.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;

  const EmptyState({
    super.key,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: CupertinoColors.systemGrey,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
INNER_EOF

cat << 'INNER_EOF' > lib/shared/widgets/loading_indicator.dart
import 'package:flutter/cupertino.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
INNER_EOF

cat << 'INNER_EOF' > lib/shared/widgets/error_state.dart
import 'package:flutter/cupertino.dart';

class ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.exclamationmark_triangle,
              size: 48,
              color: CupertinoColors.systemRed,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                color: CupertinoColors.systemGrey,
              ),
            ),
            const SizedBox(height: 24),
            CupertinoButton.filled(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
INNER_EOF

cat << 'INNER_EOF' > lib/shared/widgets/anime_cover_image.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class AnimeCoverImage extends StatelessWidget {
  final String? url;
  final String title;
  final double width;
  final double height;

  const AnimeCoverImage({
    super.key,
    required this.url,
    required this.title,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [CupertinoColors.systemIndigo, CupertinoColors.systemPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title.isNotEmpty ? title[0].toUpperCase() : '?',
          style: const TextStyle(
            color: CupertinoColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: url == null || url!.isEmpty
          ? placeholder
          : CachedNetworkImage(
              imageUrl: url!,
              width: width,
              height: height,
              fit: BoxFit.cover,
              placeholder: (context, url) => placeholder,
              errorWidget: (context, url, error) => placeholder,
            ),
    );
  }
}
INNER_EOF

cat << 'INNER_EOF' > lib/features/home/presentation/home_screen.dart
import 'package:flutter/cupertino.dart';
import '../../library/presentation/library_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
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
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return const LibraryScreen();
              case 1:
                return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(middle: Text('Search')),
                  child: Center(child: Text('Search')),
                );
              case 2:
                return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(middle: Text('Favorites')),
                  child: Center(child: Text('Favorites')),
                );
              default:
                return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
INNER_EOF

cat << 'INNER_EOF' > lib/features/library/presentation/widgets/status_filter_bar.dart
import 'package:flutter/cupertino.dart';
import '../../domain/watch_status.dart';

class StatusFilterBar extends StatelessWidget {
  final WatchStatus? selectedStatus;
  final ValueChanged<WatchStatus?> onStatusChanged;

  const StatusFilterBar({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<WatchStatus?>(
      groupValue: selectedStatus,
      children: const {
        null: Text('All'),
        WatchStatus.watching: Text('Watching'),
        WatchStatus.completed: Text('Completed'),
        WatchStatus.planToWatch: Text('Plan'),
        WatchStatus.onHold: Text('Hold'),
        WatchStatus.dropped: Text('Dropped'),
      },
      onValueChanged: onStatusChanged,
    );
  }
}
INNER_EOF

cat << 'INNER_EOF' > lib/features/library/presentation/widgets/rating_widget.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  final double initialRating;
  final ValueChanged<double>? onRatingUpdate;
  final double itemSize;
  final bool ignoreGestures;

  const RatingWidget({
    super.key,
    required this.initialRating,
    this.onRatingUpdate,
    this.itemSize = 24.0,
    this.ignoreGestures = false,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 0.5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: ignoreGestures,
      itemCount: 5,
      itemSize: itemSize,
      itemBuilder: (context, _) => const Icon(
        CupertinoIcons.star_fill,
        color: CupertinoColors.systemYellow,
      ),
      onRatingUpdate: onRatingUpdate ?? (_) {},
    );
  }
}
INNER_EOF

chmod +x create_files.sh
./create_files.sh
