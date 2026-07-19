import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class CouponCard extends StatefulWidget {
  const CouponCard({
    super.key,
    required this.onApply,
  });

  final ValueChanged<String> onApply;

  @override
  State<CouponCard> createState() =>
      _CouponCardState();
}

class _CouponCardState
    extends State<CouponCard> {
  late final TextEditingController
      _couponController;

  @override
  void initState() {
    super.initState();
    _couponController =
        TextEditingController();
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  void _applyCoupon() {
    final coupon =
        _couponController.text.trim();

    if (coupon.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter a coupon code",
          ),
        ),
      );
      return;
    }

    widget.onApply(coupon);

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          "Coupon \"$coupon\" applied",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            //--------------------------------------------------
            // Title
            //--------------------------------------------------

            Text(
              AppStrings.applyCoupon,
              style: AppTextStyles.heading3,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // Coupon TextField
            //--------------------------------------------------

            TextField(
              controller:
                  _couponController,
              textCapitalization:
                  TextCapitalization.characters,
              decoration: InputDecoration(
                hintText:
                    AppStrings.enterCoupon,
                prefixIcon: const Icon(
                  Icons.discount_outlined,
                ),
                border:
                    const OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // Apply Button
            //--------------------------------------------------

            PrimaryButton(
              text:
                  AppStrings.applyCoupon,
              icon:
                  Icons.local_offer_outlined,
              onPressed: _applyCoupon,
            ),
          ],
        ),
      ),
    );
  }
}