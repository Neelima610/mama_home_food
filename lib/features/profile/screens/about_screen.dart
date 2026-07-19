import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

import '../../../shared/widgets/custom_app_bar.dart';
import '../models/app_info_model.dart';
import '../widgets/app_version_tile.dart';
import '../widgets/profile_section.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const appInfo = AppInfoModel(
  appName: 'Mama Home Food',
  version: '1.0.0',
  buildNumber: '1',
  releaseDate: '2026-07-18',
  description:
      'Fresh homemade food prepared with love.',
  companyName: 'Mama Home Food',
  website: 'https://mamahomefood.com',
  email: 'support@mamahomefood.com',
  phoneNumber: '+91 9876543210',
);

    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.about,
        showBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        children: [
          ProfileSection(
            title: AppStrings.about,
            children: [
              Text(appInfo.description),
            ],
          ),
          const SizedBox(height: AppSizes.spaceXL),
          AppVersionTile(appInfo: appInfo),
          const SizedBox(height: AppSizes.spaceXL),
          ProfileSection(
            title: AppStrings.contactUs,
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(appInfo.website ?? '-'),
              ),
              ListTile(
                leading: const Icon(Icons.email_outlined),
                title: Text(appInfo.email ?? '-'),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(appInfo.phoneNumber ?? '-'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}