import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../providers/profile_provider.dart';
import '../widgets/logout_dialog.dart';
import '../widgets/profile_menu_tile.dart';
import '../widgets/profile_section.dart';

class SettingsScreen extends StatelessWidget {
const SettingsScreen({
super.key,
});

@override
Widget build(
BuildContext context,
) {
final provider =
context.read<ProfileProvider>();


return Scaffold(
  //--------------------------------------------------
  // App Bar
  //--------------------------------------------------

  appBar: const CustomAppBar(
    title: AppStrings.settings,
    showBackButton: true,
  ),

  //--------------------------------------------------
  // Body
  //--------------------------------------------------

  body: ListView(
    padding: const EdgeInsets.all(
      AppSizes.spaceL,
    ),

    children: [

      //--------------------------------------------------
      // Account
      //--------------------------------------------------

      ProfileSection(
        title:
            AppStrings.account,

        children: [

          ProfileMenuTile(
            icon:
                Icons.person_outline,

            title:
                AppStrings.editProfile,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.editProfile,
              );
            },
          ),

          ProfileMenuTile(
            icon:
                Icons.location_on_outlined,

            title:
                AppStrings.myAddresses,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.myAddresses,
              );
            },
          ),

          ProfileMenuTile(
            icon:
                Icons.shopping_bag_outlined,

            title:
                'My Orders',

            showDivider:
                false,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.orders,
              );
            },
          ),
        ],
      ),

      const SizedBox(
        height:
            AppSizes.spaceL,
      ),

      //--------------------------------------------------
      // Preferences
      //--------------------------------------------------

      ProfileSection(
        title:
            'Preferences',

        children: [

          ProfileMenuTile(
            icon:
                Icons.notifications_none_rounded,

            title:
                'Notifications',

            subtitle:
                'Manage notification settings',

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames
                    .notificationSettings,
              );
            },
          ),

          ProfileMenuTile(
            icon:
                Icons.language_outlined,

            title:
                'Language',

            subtitle:
                'English',

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.language,
              );
            },
          ),

          ProfileMenuTile(
            icon:
                Icons.palette_outlined,

            title:
                'Theme',

            subtitle:
                'System Default',

            showDivider:
                false,

            onTap: () {
              // Theme settings can be
              // implemented later.
            },
          ),
        ],
      ),

      const SizedBox(
        height:
            AppSizes.spaceL,
      ),

      //--------------------------------------------------
      // Security
      //--------------------------------------------------

      ProfileSection(
        title:
            'Security',

        children: [

          ProfileMenuTile(
            icon:
                Icons.lock_outline,

            title:
                'Change Password',

            onTap: () {
              // Change password screen
              // can be added later.
            },
          ),

          ProfileMenuTile(
            icon:
                Icons.privacy_tip_outlined,

            title:
                AppStrings.privacyPolicy,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.privacyPolicy,
              );
            },
          ),

          ProfileMenuTile(
            icon:
                Icons.description_outlined,

            title:
                AppStrings.termsConditions,

            showDivider:
                false,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.termsConditions,
              );
            },
          ),
        ],
      ),

      const SizedBox(
        height:
            AppSizes.spaceL,
      ),

      //--------------------------------------------------
      // Support
      //--------------------------------------------------

      ProfileSection(
        title:
            'Support',

        children: [

          ProfileMenuTile(
            icon:
                Icons.support_agent,

            title:
                AppStrings.helpSupport,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.helpSupport,
              );
            },
          ),

          ProfileMenuTile(
            icon:
                Icons.quiz_outlined,

            title:
                AppStrings.faq,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.faq,
              );
            },
          ),

          ProfileMenuTile(
            icon:
                Icons.contact_support_outlined,

            title:
                AppStrings.contactUs,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.contactUs,
              );
            },
          ),

          ProfileMenuTile(
            icon:
                Icons.info_outline,

            title:
                AppStrings.about,

            showDivider:
                false,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.about,
              );
            },
          ),
        ],
      ),

      const SizedBox(
        height:
            AppSizes.spaceL,
      ),

      //--------------------------------------------------
      // Refer & Earn
      //--------------------------------------------------

      ProfileSection(
        title:
            'More',

        children: [

          ProfileMenuTile(
            icon:
                Icons.card_giftcard_outlined,

            title:
                'Refer & Earn',

            subtitle:
                'Invite friends and earn rewards',

            showDivider:
                false,

            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.referEarn,
              );
            },
          ),
        ],
      ),

      const SizedBox(
        height:
            AppSizes.spaceL,
      ),

      //--------------------------------------------------
      // Danger Zone
      //--------------------------------------------------

      ProfileSection(
        title:
            'Danger Zone',

        children: [

          ProfileMenuTile(
            icon:
                Icons.delete_forever_outlined,

            title:
                AppStrings.deleteAccount,

            isDestructive:
                true,

            showDivider:
                false,

            onTap: () async {
              await provider
                  .deleteAccount();

              if (!context.mounted) {
                return;
              }

              Navigator.pop(context);
            },
          ),
        ],
      ),

      const SizedBox(
        height:
            AppSizes.spaceXL,
      ),

      //--------------------------------------------------
      // Logout
      //--------------------------------------------------

      ProfileMenuTile(
        icon:
            Icons.logout_rounded,

        title:
            AppStrings.logout,

        isDestructive:
            true,

        showDivider:
            false,

        onTap: () {
          LogoutDialog.show(
            context,

            onLogout: () async {
              await provider.logout();

              if (!context.mounted) {
                return;
              }

              Navigator.popUntil(
                context,
                (route) =>
                    route.isFirst,
              );
            },
          );
        },
      ),

      const SizedBox(
        height:
            AppSizes.spaceXXL,
      ),
    ],
  ),
);

}
}
