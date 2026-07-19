import 'package:flutter/material.dart';


import '../../../core/theme/themes.dart';
import '../models/app_info_model.dart';


class AppVersionTile extends StatelessWidget {
  const AppVersionTile({
    super.key,
    required this.appInfo,
  });

  final AppInfoModel appInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.info_outline_rounded,
      ),
      title: Text(
        appInfo.appName,
      ),
      subtitle: Text(
        'Version ${appInfo.version} (${appInfo.buildNumber})',
      ),
      trailing: Text(
        appInfo.releaseDate,
        style: AppTextStyles.bodySmall,
      ),
    );
  }
}