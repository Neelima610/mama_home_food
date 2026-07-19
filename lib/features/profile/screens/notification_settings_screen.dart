import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class NotificationsSettingsScreen
extends StatefulWidget {
const NotificationsSettingsScreen({
super.key,
});

@override
State<NotificationsSettingsScreen>
createState() =>
_NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState
extends State<
NotificationsSettingsScreen> {

//--------------------------------------------------
// State
//--------------------------------------------------

bool _orderUpdates = true;

bool _promotionalOffers = true;

bool _generalNotifications = true;

//--------------------------------------------------
// Storage Keys
//--------------------------------------------------

static const String
_orderUpdatesKey =
'notification_order_updates';

static const String
_promotionalOffersKey =
'notification_promotional_offers';

static const String
_generalNotificationsKey =
'notification_general';

//--------------------------------------------------
// Lifecycle
//--------------------------------------------------

@override
void initState() {
super.initState();


_loadSettings();


}

//--------------------------------------------------
// Build
//--------------------------------------------------

@override
Widget build(
BuildContext context,
) {
return Scaffold(
//--------------------------------------------------
// App Bar
//--------------------------------------------------


  appBar: const CustomAppBar(
    title:
        'Notification Settings',

    showBackButton:
        true,
  ),

  //--------------------------------------------------
  // Body
  //--------------------------------------------------

  body: ListView(
    padding:
        const EdgeInsets.all(
      AppSizes.screenPadding,
    ),

    children: [

      //--------------------------------------------------
      // Order Updates
      //--------------------------------------------------

      SwitchListTile.adaptive(
        title:
            const Text(
          'Order Updates',
        ),

        subtitle:
            const Text(
          'Receive updates about your orders.',
        ),

        value:
            _orderUpdates,

        onChanged:
            (value) {
          _updateSetting(
            type:
                _NotificationType
                    .orderUpdates,

            value:
                value,
          );
        },
      ),

      const Divider(),

      //--------------------------------------------------
      // Promotional Offers
      //--------------------------------------------------

      SwitchListTile.adaptive(
        title:
            const Text(
          'Promotional Offers',
        ),

        subtitle:
            const Text(
          'Receive offers and special deals.',
        ),

        value:
            _promotionalOffers,

        onChanged:
            (value) {
          _updateSetting(
            type:
                _NotificationType
                    .promotionalOffers,

            value:
                value,
          );
        },
      ),

      const Divider(),

      //--------------------------------------------------
      // General Notifications
      //--------------------------------------------------

      SwitchListTile.adaptive(
        title:
            const Text(
          'General Notifications',
        ),

        subtitle:
            const Text(
          'Receive important app notifications.',
        ),

        value:
            _generalNotifications,

        onChanged:
            (value) {
          _updateSetting(
            type:
                _NotificationType
                    .generalNotifications,

            value:
                value,
          );
        },
      ),
    ],
  ),
);


}

//--------------------------------------------------
// Load Settings
//--------------------------------------------------

Future<void> _loadSettings()
async {
final preferences =
await SharedPreferences
.getInstance();


if (!mounted) {
  return;
}

setState(() {
  _orderUpdates =
      preferences.getBool(
            _orderUpdatesKey,
          ) ??
          true;

  _promotionalOffers =
      preferences.getBool(
            _promotionalOffersKey,
          ) ??
          true;

  _generalNotifications =
      preferences.getBool(
            _generalNotificationsKey,
          ) ??
          true;
});


}

//--------------------------------------------------
// Update Setting
//--------------------------------------------------

Future<void> _updateSetting({
required _NotificationType type,
required bool value,
}) async {
final preferences =
await SharedPreferences
.getInstance();


switch (type) {
  case _NotificationType
      .orderUpdates:
    setState(() {
      _orderUpdates =
          value;
    });

    await preferences.setBool(
      _orderUpdatesKey,
      value,
    );

  case _NotificationType
      .promotionalOffers:
    setState(() {
      _promotionalOffers =
          value;
    });

    await preferences.setBool(
      _promotionalOffersKey,
      value,
    );

  case _NotificationType
      .generalNotifications:
    setState(() {
      _generalNotifications =
          value;
    });

    await preferences.setBool(
      _generalNotificationsKey,
      value,
    );
}


}
}

//--------------------------------------------------
// Notification Type
//--------------------------------------------------

enum _NotificationType {
orderUpdates,
promotionalOffers,
generalNotifications,
}
