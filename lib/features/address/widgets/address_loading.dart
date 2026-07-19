import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';


class AddressLoading extends StatelessWidget {
  const AddressLoading({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.only(
            bottom: AppSizes.spaceL,
          ),

          height: 150,

          decoration: BoxDecoration(
            color: AppColors.background,

            borderRadius:
                BorderRadius.circular(
              AppSizes.radiusL,
            ),

            border: Border.all(
              color: AppColors.border,
            ),
          ),
        ),
      ),
    );
  }
}