import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../models/app_info_model.dart';
import '../providers/profile_provider.dart';
import '../widgets/app_version_tile.dart';
import '../widgets/logout_dialog.dart';
import '../widgets/profile_empty.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_loading.dart';
import '../widgets/profile_logout_tile.dart';
import '../widgets/profile_menu_tile.dart';
import '../widgets/profile_section.dart';
import '../widgets/profile_statistics.dart';
import '../widgets/profile_stats_card.dart';

class ProfileScreen extends StatefulWidget {
const ProfileScreen({
super.key,
});

@override
State<ProfileScreen> createState() =>
_ProfileScreenState();
}

class _ProfileScreenState
extends State<ProfileScreen> {

//--------------------------------------------------
// App Information
//--------------------------------------------------

final AppInfoModel _appInfo =
const AppInfoModel(
appName: AppConstants.appName,
version: AppConstants.version,
buildNumber: '1',
description:
'Authentic homemade food delivered with love.',
companyName:
AppConstants.appName,
releaseDate: '2026',
);

//--------------------------------------------------
// Lifecycle
//--------------------------------------------------

@override
void initState() {
super.initState();

WidgetsBinding.instance
    .addPostFrameCallback((_) {
  context
      .read<ProfileProvider>()
      .loadProfile();
});


}

//--------------------------------------------------
// Build
//--------------------------------------------------

@override
Widget build(
BuildContext context,
) {
return Consumer<ProfileProvider>(
builder: (
context,
provider,
child,
) {
//--------------------------------------------------
// Loading
//--------------------------------------------------

    if (provider.isLoading &&
        !provider.hasUser) {
      return const Scaffold(
        body: ProfileLoading(),
      );
    }

    //--------------------------------------------------
    // Empty
    //--------------------------------------------------

    if (!provider.hasUser) {
      return Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.profile,
        ),

        body: ProfileEmpty(
          onRefresh:
              provider.loadProfile,
        ),
      );
    }

    final user =
        provider.user!;

    //--------------------------------------------------
    // Profile
    //--------------------------------------------------

    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.profile,
      ),

      body: RefreshIndicator(
        onRefresh:
            provider.refreshProfile,

        child: ListView(
          padding:
              const EdgeInsets.all(
            AppSizes.spaceL,
          ),

          children: [

            //--------------------------------------------------
            // Profile Header
            //--------------------------------------------------

            ProfileHeader(
              user: user,

              onEdit: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.editProfile,
                );
              },
            ),

            const SizedBox(
              height:
                  AppSizes.spaceXL,
            ),

            //--------------------------------------------------
            // Statistics
            //--------------------------------------------------

            ProfileStatistics(
              children: [

                ProfileStatsCard(
                  title: 'Orders',
                  value: '25',
                  icon:
                      Icons.shopping_bag_rounded,
                ),

                ProfileStatsCard(
                  title: 'Addresses',
                  value: '3',
                  icon:
                      Icons.location_on_rounded,
                ),

                ProfileStatsCard(
                  title: 'Favorites',
                  value: '18',
                  icon:
                      Icons.favorite_rounded,
                ),
              ],
            ),

            const SizedBox(
              height:
                  AppSizes.spaceXL,
            ),

            //--------------------------------------------------
            // Account
            //--------------------------------------------------

            ProfileSection(
              title:
                  AppStrings.account,

              children: [

                ProfileMenuTile(
                  title:
                      AppStrings.editProfile,

                  icon:
                      Icons.person_rounded,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.editProfile,
                    );
                  },
                ),

                ProfileMenuTile(
                  title:
                      AppStrings.myAddresses,

                  icon:
                      Icons.location_on_outlined,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.myAddresses,
                    );
                  },
                ),

                ProfileMenuTile(
                  title:
                      AppStrings.favorites,

                  icon:
                      Icons.favorite_border_rounded,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.favorites,
                    );
                  },

                  showDivider:
                      false,
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
                  title:
                      'Notification Settings',

                  icon:
                      Icons.notifications_outlined,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames
                          .notificationSettings,
                    );
                  },
                ),

                ProfileMenuTile(
                  title:
                      'Language',

                  icon:
                      Icons.language_outlined,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.language,
                    );
                  },

                  showDivider:
                      false,
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
                  title:
                      AppStrings.helpSupport,

                  icon:
                      Icons.support_agent,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.helpSupport,
                    );
                  },
                ),

                ProfileMenuTile(
                  title:
                      AppStrings.faq,

                  icon:
                      Icons.quiz_outlined,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.faq,
                    );
                  },
                ),

                ProfileMenuTile(
                  title:
                      AppStrings.contactUs,

                  icon:
                      Icons.contact_support_outlined,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.contactUs,
                    );
                  },

                  showDivider:
                      false,
                ),
              ],
            ),

            const SizedBox(
              height:
                  AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // More
            //--------------------------------------------------

            ProfileSection(
              title:
                  'More',

              children: [

                ProfileMenuTile(
                  title:
                      'Refer & Earn',

                  icon:
                      Icons.card_giftcard_outlined,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.referEarn,
                    );
                  },
                ),

                ProfileMenuTile(
                  title:
                      AppStrings.about,

                  icon:
                      Icons.info_outline,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.about,
                    );
                  },

                  showDivider:
                      false,
                ),
              ],
            ),

            const SizedBox(
              height:
                  AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // Legal
            //--------------------------------------------------

            ProfileSection(
              title:
                  'Legal',

              children: [

                ProfileMenuTile(
                  title:
                      AppStrings.privacyPolicy,

                  icon:
                      Icons.privacy_tip_outlined,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.privacyPolicy,
                    );
                  },
                ),

                ProfileMenuTile(
                  title:
                      AppStrings.termsConditions,

                  icon:
                      Icons.description_outlined,

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.termsConditions,
                    );
                  },

                  showDivider:
                      false,
                ),
              ],
            ),

            const SizedBox(
              height:
                  AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // Logout
            //--------------------------------------------------

            ProfileLogoutTile(
              onTap: () {
                LogoutDialog.show(
                  context,

                  onLogout:
                      provider.logout,
                );
              },
            ),

            const SizedBox(
              height:
                  AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // App Version
            //--------------------------------------------------

            AppVersionTile(
              appInfo:
                  _appInfo,
            ),

            const SizedBox(
              height:
                  AppSizes.spaceXXL,
            ),
          ],
        ),
      ),
    );
  },
);

}
}
