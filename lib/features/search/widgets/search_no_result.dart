import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class SearchNoResult extends StatelessWidget {
  const SearchNoResult({
    super.key,
    required this.query,
    this.onClear,
  });

  final String query;

  final VoidCallback? onClear;

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
                color: AppColors.surface,

                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.search_off_rounded,

                size: 48,

                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            Text(
              'No products found',

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
              'We couldn\'t find anything for',

              style:
                  AppTextStyles.bodyMedium.copyWith(
                color:
                    AppColors.textSecondary,
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceXS,
            ),

            Text(
              '"$query"',

              maxLines: 1,

              overflow:
                  TextOverflow.ellipsis,

              textAlign: TextAlign.center,

              style:
                  AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,

                fontWeight:
                    FontWeight.w600,
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceS,
            ),

            Text(
              'Try searching with a different name '
              'or category.',

              textAlign: TextAlign.center,

              style:
                  AppTextStyles.bodySmall.copyWith(
                color:
                    AppColors.textSecondary,
              ),
            ),

            if (onClear != null) ...[
              const SizedBox(
                height: AppSizes.spaceL,
              ),

              OutlinedButton(
                onPressed: onClear,

                child: const Text(
                  'Clear Search',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}