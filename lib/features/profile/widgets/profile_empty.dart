import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/themes.dart';

class ProfileEmpty extends StatelessWidget {
  const ProfileEmpty({
    super.key,
    this.onRefresh,
  });

  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceXL,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.person_off_outlined,
              size: 80,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            Text(
              AppStrings.noDataFound,
              style: AppTextStyles.heading4,
            ),

            const SizedBox(
              height: AppSizes.spaceS,
            ),

            Text(
              AppStrings.tryAgain,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            FilledButton(
              onPressed: onRefresh,
              child: Text(
                AppStrings.refresh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}