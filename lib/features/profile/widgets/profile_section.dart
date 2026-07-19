import 'package:flutter/material.dart';


import '../../../core/constants/constants.dart';
import '../../../core/theme/themes.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.title,
    required this.children,
    this.actionText,
    this.onAction,
    this.padding,
  });

  final String title;
  final List<Widget> children;
  final String? actionText;
  final VoidCallback? onAction;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ??
          const EdgeInsets.symmetric(
            vertical: AppSizes.spaceM,
          ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style:
                      AppTextStyles.heading4,
                ),
              ),

              if (actionText != null &&
                  onAction != null)
                TextButton(
                  onPressed: onAction,
                  child: Text(actionText!),
                ),
            ],
          ),

          const SizedBox(
            height: AppSizes.spaceS,
          ),

          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(
                AppSizes.radiusL,
              ),
            ),
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}