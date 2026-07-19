import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class SearchSortBottomSheet extends StatelessWidget {
  const SearchSortBottomSheet({
    super.key,
    required this.selectedSort,
    required this.onSelected,
  });

  final String selectedSort;

  final ValueChanged<String> onSelected;

  static const List<String> sortOptions = [
    'Relevance',
    'Price: Low to High',
    'Price: High to Low',
    'Top Rated',
    'Most Popular',
    'Newest',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceL,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Text(
                  'Sort By',

                  style:
                      AppTextStyles.titleLarge.copyWith(
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  icon: const Icon(
                    Icons.close_rounded,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            ...sortOptions.map(
              (option) {
                final isSelected =
                    option == selectedSort;

                return ListTile(
                  contentPadding:
                      EdgeInsets.zero,

                  title: Text(
                    option,

                    style: AppTextStyles.bodyMedium,
                  ),

                  trailing: Radio<String>(
                    value: option,

                    groupValue: selectedSort,

                    activeColor:
                        AppColors.primary,

                    onChanged: (_) {
                      onSelected(option);

                      Navigator.pop(context);
                    },
                  ),

                  onTap: () {
                    onSelected(option);

                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}