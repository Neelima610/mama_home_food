import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.termsAndConditions,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        child: Text(
          '''
Welcome to Mama Home Food.

• Orders can be cancelled before preparation begins.

• Prices may change without prior notice.

• Delivery times are estimated.

• Refunds follow our refund policy.

• Misuse of the application may result in account suspension.

• Continued use of the app indicates acceptance of these terms.
''',
        ),
      ),
    );
  }
}