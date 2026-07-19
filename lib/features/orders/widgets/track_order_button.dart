

// track_order_button.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/buttons/custom_button.dart';

class TrackOrderButton extends StatelessWidget {
  const TrackOrderButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.buttonWidth,
      child: CustomButton(
        key: const ValueKey(
          AppKeys.trackOrderButton,
        ),
        text: AppStrings.trackOrder,
        icon: Icons.local_shipping_outlined,
        onPressed: onPressed,
      ),
    );
  }
}