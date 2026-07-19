

// cancel_order_dialog.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class CancelOrderDialog extends StatefulWidget {
  const CancelOrderDialog({
    super.key,
    required this.onConfirm,
  });

  final ValueChanged<String> onConfirm;

  @override
  State<CancelOrderDialog> createState() =>
      _CancelOrderDialogState();
}

class _CancelOrderDialogState
    extends State<CancelOrderDialog> {
  final TextEditingController
      _reasonController =
      TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      title: Text(
        AppStrings.cancelOrder,
        style:
            AppTextStyles.titleLarge,
      ),
      content: Column(
        mainAxisSize:
            MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.cancelOrderMessage,
            style:
                AppTextStyles.bodyMedium,
          ),

          const SizedBox(
            height: AppSizes.spaceL,
          ),

          TextField(
            key: const ValueKey(
              AppKeys.cancelReasonField,
            ),
            controller:
                _reasonController,
            maxLines: AppNumbers.three,
            textInputAction:
                TextInputAction.done,
            decoration:
                InputDecoration(
              hintText:
                  AppStrings.cancelReasonHint,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.close,
          ),
        ),
        FilledButton(
          onPressed: () {
            widget.onConfirm(
              _reasonController.text
                  .trim(),
            );
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.confirm,
          ),
        ),
      ],
    );
  }
}