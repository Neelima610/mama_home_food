import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
const ContactUsScreen({
super.key,
});

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
    title: AppStrings.contactUs,
    showBackButton: true,
  ),

  //--------------------------------------------------
  // Body
  //--------------------------------------------------

  body: SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(
        AppSizes.screenPadding,
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          //--------------------------------------------------
          // Header
          //--------------------------------------------------

          Text(
            'We are here to help',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(
                  fontWeight:
                      FontWeight.bold,
                ),
          ),

          const SizedBox(
            height:
                AppSizes.spaceS,
          ),

          Text(
            'Have a question or need assistance? '
            'Feel free to contact us.',
            style: Theme.of(context)
                .textTheme
                .bodyMedium,
          ),

          const SizedBox(
            height:
                AppSizes.spaceXL,
          ),

          //--------------------------------------------------
          // Phone
          //--------------------------------------------------

          _ContactCard(
            icon:
                Icons.phone_outlined,

            title:
                'Call Us',

            value:
                AppConstants.phonePrimary,

            onTap: () {
              _makePhoneCall(
                AppConstants.phonePrimary,
              );
            },
          ),

          const SizedBox(
            height:
                AppSizes.spaceM,
          ),

          //--------------------------------------------------
          // Secondary Phone
          //--------------------------------------------------

          _ContactCard(
            icon:
                Icons.phone_outlined,

            title:
                'Alternate Number',

            value:
                AppConstants.phoneSecondary,

            onTap: () {
              _makePhoneCall(
                AppConstants.phoneSecondary,
              );
            },
          ),

          const SizedBox(
            height:
                AppSizes.spaceM,
          ),

          //--------------------------------------------------
          // Email
          //--------------------------------------------------

          _ContactCard(
            icon:
                Icons.email_outlined,

            title:
                'Email Us',

            value:
                AppConstants.email,

            onTap: () {
              _sendEmail(
                AppConstants.email,
              );
            },
          ),

          const SizedBox(
            height:
                AppSizes.spaceM,
          ),

          //--------------------------------------------------
          // Business
          //--------------------------------------------------

          _ContactCard(
            icon:
                Icons.home_work_outlined,

            title:
                'Business',

            value:
                AppConstants.businessType,
          ),

          const SizedBox(
            height:
                AppSizes.spaceXL,
          ),

          //--------------------------------------------------
          // Support Message
          //--------------------------------------------------

          Card(
            child: Padding(
              padding:
                  const EdgeInsets.all(
                AppSizes.spaceL,
              ),

              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Icon(
                    Icons.favorite_outline,

                    color: Theme.of(
                      context,
                    )
                        .colorScheme
                        .primary,
                  ),

                  const SizedBox(
                    width:
                        AppSizes.spaceM,
                  ),

                  Expanded(
                    child: Text(
                      'Thank you for choosing '
                      '${AppConstants.appName}. '
                      'We value your support.',

                      style: Theme.of(
                        context,
                      )
                          .textTheme
                          .bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);


}

//--------------------------------------------------
// Phone
//--------------------------------------------------

Future<void> _makePhoneCall(
String phoneNumber,
) async {
final uri = Uri(
scheme: 'tel',
path: phoneNumber,
);


if (await canLaunchUrl(uri)) {
  await launchUrl(uri);
}


}

//--------------------------------------------------
// Email
//--------------------------------------------------

Future<void> _sendEmail(
String email,
) async {
final uri = Uri(
scheme: 'mailto',
path: email,
);


if (await canLaunchUrl(uri)) {
  await launchUrl(uri);
}


}
}

//--------------------------------------------------
// Contact Card
//--------------------------------------------------

class _ContactCard
extends StatelessWidget {
const _ContactCard({
required this.icon,
required this.title,
required this.value,
this.onTap,
});

final IconData icon;

final String title;

final String value;

final VoidCallback? onTap;

@override
Widget build(
BuildContext context,
) {
return Card(
child: ListTile(
onTap:
onTap,


    leading: Icon(
      icon,

      color: Theme.of(
        context,
      )
          .colorScheme
          .primary,
    ),

    title: Text(
      title,
    ),

    subtitle: Text(
      value,
    ),

    trailing:
        onTap == null
            ? null
            : const Icon(
                Icons.chevron_right_rounded,
              ),
  ),
);


}
}
