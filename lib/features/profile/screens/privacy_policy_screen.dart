import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.privacyPolicy,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        child: Text(
          '''
Mama Home Food values your privacy.

• We collect only the information required to provide our services.

• Your personal information is never sold to third parties.

• Payment information is processed securely.

• Your location is used only for delivery.

• We use your phone number and email for order updates and support.

• By using this application you agree to this privacy policy.
''',
        ),
      ),
    );
  }
}