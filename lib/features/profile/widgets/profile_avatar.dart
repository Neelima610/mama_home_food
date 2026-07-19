import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.radius = AppSizes.avatarXL,
    this.showEditButton = false,
    this.onEdit,
  });

  final String? imageUrl;
  final double radius;
  final bool showEditButton;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          //--------------------------------------------------
          // Avatar
          //--------------------------------------------------

          CircleAvatar(
            radius: radius,
            backgroundColor:
                AppColors.primary.withValues(
              alpha: 0.08,
            ),
            backgroundImage:
                (imageUrl != null &&
                        imageUrl!.isNotEmpty)
                    ? NetworkImage(imageUrl!)
                    : const AssetImage(
                            AppAssets
                                .profilePlaceholder,
                          )
                          as ImageProvider,
          ),

          //--------------------------------------------------
          // Edit Button
          //--------------------------------------------------

          if (showEditButton)
            Positioned(
              right: 0,
              bottom: 0,
              child: Material(
                color: AppColors.primary,
                shape: const CircleBorder(),
                elevation: 2,
                child: InkWell(
                  onTap: onEdit,
                  customBorder:
                      const CircleBorder(),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(8),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: AppSizes.iconS,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}