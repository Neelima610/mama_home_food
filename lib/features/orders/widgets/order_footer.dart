

// order_footer.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import 'cancel_order_button.dart';
import 'order_invoice_button.dart';
import 'reorder_button.dart';
import 'track_order_button.dart';

class OrderFooter extends StatelessWidget {
  const OrderFooter({
    super.key,
    required this.showTrackButton,
    required this.showCancelButton,
    required this.showInvoiceButton,
    required this.showReorderButton,
    this.onTrack,
    this.onCancel,
    this.onInvoice,
    this.onReorder,
  });

  final bool showTrackButton;

  final bool showCancelButton;

  final bool showInvoiceButton;

  final bool showReorderButton;

  final VoidCallback? onTrack;

  final VoidCallback? onCancel;

  final VoidCallback? onInvoice;

  final VoidCallback? onReorder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: AppColors.divider,
              width: AppSizes.one,
            ),
          ),
        ),
        child: Wrap(
          spacing: AppSizes.spaceM,
          runSpacing: AppSizes.spaceM,
          alignment:
              WrapAlignment.center,
          children: [
            if (showTrackButton)
              TrackOrderButton(
                onPressed: onTrack,
              ),

            if (showCancelButton)
              CancelOrderButton(
                onPressed: onCancel,
              ),

            if (showInvoiceButton)
              OrderInvoiceButton(
                onPressed: onInvoice,
              ),

            if (showReorderButton)
              ReorderButton(
                onPressed: onReorder,
              ),
          ],
        ),
      ),
    );
  }
}