
// login_header.dart
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/common/app_logo.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.showLogo = true,
    this.showAppName = true,
    this.showTagline = true,
  });

  final String title;
  final String subtitle;

  final bool showLogo;
  final bool showAppName;
  final bool showTagline;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //--------------------------------------------------
        // App Logo
        //--------------------------------------------------

        if (showLogo) ...[
          const AppLogo(
            width: AppSizes.logoL,
            height: AppSizes.logoL,
          ),

          const SizedBox(
            height: AppSizes.spaceL,
          ),
        ],

        //--------------------------------------------------
        // App Name
        //--------------------------------------------------

        if (showAppName) ...[
          Text(
            AppStrings.appName,
            style: AppTextStyles.heading1,
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: AppSizes.spaceS,
          ),
        ],

        //--------------------------------------------------
        // Tagline
        //--------------------------------------------------

        if (showTagline) ...[
          Text(
            AppStrings.appTagline,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: AppSizes.spaceXXL,
          ),
        ],

        //--------------------------------------------------
        // Screen Title
        //--------------------------------------------------

        Text(
          title,
          style: AppTextStyles.heading2,
          textAlign: TextAlign.center,
        ),

        const SizedBox(
          height: AppSizes.spaceS,
        ),

        //--------------------------------------------------
        // Subtitle
        //--------------------------------------------------

        Text(
          subtitle,
          style: AppTextStyles.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
