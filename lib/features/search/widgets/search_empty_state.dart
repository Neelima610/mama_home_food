import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({
    super.key,
    this.onSuggestionTap,
  });

  final VoidCallback? onSuggestionTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceXL,
        ),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            Container(
              width: 100,
              height: 100,

              decoration: BoxDecoration(
                color: AppColors.primary
                    .withOpacity(0.1),

                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.search_rounded,

                size: 48,

                color: AppColors.primary,
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            Text(
              'Search for homemade food',

              textAlign: TextAlign.center,

              style:
                  AppTextStyles.titleLarge.copyWith(
                fontWeight:
                    FontWeight.w700,
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceS,
            ),

            Text(
              'Find delicious homemade meals, '
              'snacks, pickles and more.',

              textAlign: TextAlign.center,

              style:
                  AppTextStyles.bodyMedium.copyWith(
                color:
                    AppColors.textSecondary,
              ),
            ),

            if (onSuggestionTap != null) ...[
              const SizedBox(
                height: AppSizes.spaceL,
              ),

              TextButton(
                onPressed: onSuggestionTap,

                child: const Text(
                  'Explore Products',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}