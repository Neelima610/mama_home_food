import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/themes.dart';
import '../../../models/user/user_model.dart';
import '../helpers/profile_helper.dart';
import 'profile_avatar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
    this.onEdit,
    this.showEditButton = true,
  });

  final UserModel user;
  final VoidCallback? onEdit;
  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(
        AppSizes.spaceL,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: Column(
        children: [
          ProfileAvatar(
            imageUrl: user.profileImage,
            radius: AppSizes.avatarXL,
            showEditButton: showEditButton,
            onEdit: onEdit,
          ),

          const SizedBox(
            height: AppSizes.spaceM,
          ),

          Text(
            user.fullName,
            style: AppTextStyles.heading2.copyWith(
              color: AppColors.white,
            ),
          ),

          const SizedBox(
            height: AppSizes.spaceXS,
          ),

          Text(
            user.email,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.white,
            ),
          ),

          const SizedBox(
            height: AppSizes.spaceM,
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.spaceM,
              vertical: AppSizes.spaceS,
            ),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(
                alpha: 0.15,
              ),
              borderRadius:
                  BorderRadius.circular(
                AppSizes.radiusXL,
              ),
            ),
            child: Text(
              ProfileHelper.greeting(),
              style: AppTextStyles.labelLarge
                  .copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}