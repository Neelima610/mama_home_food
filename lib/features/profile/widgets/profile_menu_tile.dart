import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';

class ProfileMenuTile extends StatelessWidget {
const ProfileMenuTile({
super.key,
required this.title,
this.subtitle,
required this.icon,
this.trailing,
this.onTap,
this.showDivider = true,
this.iconColor,
this.textColor,
this.isDestructive = false,
});

//--------------------------------------------------
// Properties
//--------------------------------------------------

final String title;

final String? subtitle;

final IconData icon;

final Widget? trailing;

final VoidCallback? onTap;

final bool showDivider;

final Color? iconColor;

final Color? textColor;

final bool isDestructive;

//--------------------------------------------------
// Build
//--------------------------------------------------

@override
Widget build(BuildContext context) {
final colorScheme =
Theme.of(context).colorScheme;


//--------------------------------------------------
// Effective Colors
//--------------------------------------------------

final effectiveIconColor =
    isDestructive
        ? AppColors.error
        : (iconColor ??
            colorScheme.primary);

final effectiveTextColor =
    isDestructive
        ? AppColors.error
        : (textColor ??
            colorScheme.onSurface);

return Column(
  children: [

    //--------------------------------------------------
    // Menu Tile
    //--------------------------------------------------

    ListTile(
      contentPadding:
          const EdgeInsets.symmetric(
        horizontal:
            AppSizes.spaceS,
      ),

      onTap: onTap,

      //--------------------------------------------------
      // Leading Icon
      //--------------------------------------------------

      leading: Container(
        width: 42,
        height: 42,

        decoration: BoxDecoration(
          color: effectiveIconColor
              .withValues(
            alpha: 0.08,
          ),

          borderRadius:
              BorderRadius.circular(
            AppSizes.radiusM,
          ),
        ),

        child: Icon(
          icon,

          color:
              effectiveIconColor,

          size:
              AppSizes.iconM,
        ),
      ),

      //--------------------------------------------------
      // Title
      //--------------------------------------------------

      title: Text(
        title,

        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(
              color:
                  effectiveTextColor,

              fontWeight:
                  FontWeight.w500,
            ),
      ),

      //--------------------------------------------------
      // Subtitle
      //--------------------------------------------------

      subtitle:
          subtitle == null
              ? null
              : Text(
                  subtitle!,
                ),

      //--------------------------------------------------
      // Trailing
      //--------------------------------------------------

      trailing:
          trailing ??
          Icon(
            Icons.chevron_right_rounded,

            color:
                colorScheme
                    .onSurfaceVariant,
          ),
    ),

    //--------------------------------------------------
    // Divider
    //--------------------------------------------------

    if (showDivider)
      const Divider(
        height: 1,

        indent: 70,

        endIndent:
            AppSizes.spaceM,
      ),
  ],
);

}
}
