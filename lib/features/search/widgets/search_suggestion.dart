
// search_suggestion.dart
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
// import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.search,
        color: AppColors.primary,
      ),
      title: Text(
        text,
        style: AppTextStyles.bodyMedium,
      ),
      onTap: onTap,
    );
  }
}