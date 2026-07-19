import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
    required this.onClear,
    this.hintText = 'Search for homemade food...',
  });

  final TextEditingController controller;

  final FocusNode focusNode;

  final ValueChanged<String> onChanged;

  final ValueChanged<String> onSubmitted;

  final VoidCallback onClear;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,

      decoration: BoxDecoration(
        color: AppColors.surface,

        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: TextField(
        controller: controller,

        focusNode: focusNode,

        textInputAction:
            TextInputAction.search,

        onChanged: onChanged,

        onSubmitted: onSubmitted,

        style: AppTextStyles.bodyMedium,

        decoration: InputDecoration(
          hintText: hintText,

          hintStyle:
              AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),

          prefixIcon: const Icon(
            Icons.search_rounded,

            color: AppColors.primary,
          ),

          suffixIcon: controller.text
                  .trim()
                  .isNotEmpty
              ? IconButton(
                  onPressed: onClear,

                  icon: const Icon(
                    Icons.close_rounded,

                    color:
                        AppColors.textSecondary,
                  ),
                )
              : null,

          border: InputBorder.none,

          contentPadding:
              const EdgeInsets.symmetric(
            horizontal: AppSizes.spaceM,
            vertical: AppSizes.spaceM,
          ),
        ),
      ),
    );
  }
}