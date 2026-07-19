import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class ReferEarnScreen
extends StatelessWidget {
const ReferEarnScreen({
super.key,
});

//--------------------------------------------------
// Referral Code
//--------------------------------------------------

static const String referralCode =
'MAMA2026';

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
        'Refer & Earn',

    showBackButton:
        true,
  ),

  //--------------------------------------------------
  // Body
  //--------------------------------------------------

  body: SingleChildScrollView(
    padding:
        const EdgeInsets.all(
      AppSizes.screenPadding,
    ),

    child: Column(
      children: [

        //--------------------------------------------------
        // Header
        //--------------------------------------------------

        const SizedBox(
          height:
              AppSizes.spaceXL,
        ),

        Icon(
          Icons.card_giftcard_outlined,

          size:
              AppSizes.logoM,

          color: Theme.of(
            context,
          )
              .colorScheme
              .primary,
        ),

        const SizedBox(
          height:
              AppSizes.spaceL,
        ),

        Text(
          'Refer your friends and earn rewards',

          textAlign:
              TextAlign.center,

          style: Theme.of(
            context,
          )
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
          'Share your referral code with your friends '
          'and invite them to enjoy homemade food.',

          textAlign:
              TextAlign.center,

          style: Theme.of(
            context,
          )
              .textTheme
              .bodyMedium,
        ),

        const SizedBox(
          height:
              AppSizes.spaceXXL,
        ),

        //--------------------------------------------------
        // Referral Code
        //--------------------------------------------------

        Card(
          child: Padding(
            padding:
                const EdgeInsets.all(
              AppSizes.spaceL,
            ),

            child: Column(
              children: [

                Text(
                  'Your Referral Code',

                  style: Theme.of(
                    context,
                  )
                      .textTheme
                      .titleMedium,
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceM,
                ),

                Text(
                  referralCode,

                  style: Theme.of(
                    context,
                  )
                      .textTheme
                      .headlineMedium
                      ?.copyWith(
                        fontWeight:
                            FontWeight.bold,

                        letterSpacing:
                            2,
                      ),
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceM,
                ),

                OutlinedButton.icon(
                  onPressed: () {
                    Clipboard.setData(
                      const ClipboardData(
                        text:
                            referralCode,
                      ),
                    );

                    ScaffoldMessenger
                        .of(
                      context,
                    ).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Referral code copied',
                        ),
                      ),
                    );
                  },

                  icon:
                      const Icon(
                    Icons.copy,
                  ),

                  label:
                      const Text(
                    'Copy Code',
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(
          height:
              AppSizes.spaceL,
        ),

        //--------------------------------------------------
        // Share
        //--------------------------------------------------

        SizedBox(
          width:
              double.infinity,

          child:
              FilledButton.icon(
            onPressed: () {
              Share.share(
                'Enjoy delicious homemade food from '
                '${AppConstants.appName}! '
                'Use my referral code: '
                '$referralCode',
              );
            },

            icon:
                const Icon(
              Icons.share_outlined,
            ),

            label:
                const Text(
              'Share Referral Code',
            ),
          ),
        ),
      ],
    ),
  ),
);


}
}
