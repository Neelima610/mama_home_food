import 'package:flutter/material.dart';

import '../../../models/search/search_history_model.dart';

class RecentSearchCard extends StatelessWidget {
  final SearchHistoryModel history;

  final VoidCallback onTap;

  final VoidCallback onRemove;

  const RecentSearchCard({
    super.key,
    required this.history,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: Icon(
        Icons.history,
        color: theme.colorScheme.onSurfaceVariant,
      ),

      title: Text(
        history.query,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),

      trailing: IconButton(
        onPressed: onRemove,
        icon: const Icon(
          Icons.close,
        ),
      ),

      onTap: onTap,
    );
  }
}