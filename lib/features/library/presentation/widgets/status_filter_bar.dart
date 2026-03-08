import 'package:flutter/cupertino.dart';

import '../../domain/watch_status.dart';

class StatusFilterBar extends StatelessWidget {
  const StatusFilterBar({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  final WatchStatus? selectedStatus;
  final ValueChanged<WatchStatus?> onStatusChanged;

  @override
  Widget build(BuildContext context) {
    final selectedKey = selectedStatus?.name ?? 'all';

    return CupertinoSlidingSegmentedControl<String>(
      groupValue: selectedKey,
      children: {
        'all': const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text('All'),
        ),
        for (final status in WatchStatus.values)
          status.name: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(status.displayName),
          ),
      },
      onValueChanged: (value) {
        if (value == null || value == 'all') {
          onStatusChanged(null);
          return;
        }

        onStatusChanged(
          WatchStatus.values.firstWhere((status) => status.name == value),
        );
      },
    );
  }
}
