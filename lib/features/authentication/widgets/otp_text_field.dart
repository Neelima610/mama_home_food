
// otp_text_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';

class OtpTextField extends StatefulWidget {
  const OtpTextField({
    super.key,
    required this.controller,
    this.onCompleted,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onCompleted;

  @override
  State<OtpTextField> createState() =>
      _OtpTextFieldState();
}

class _OtpTextFieldState
    extends State<OtpTextField> {
  static const int _otpLength = 6;

  late final List<TextEditingController>
      _controllers;

  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      _otpLength,
      (_) => TextEditingController(),
    );

    _focusNodes = List.generate(
      _otpLength,
      (_) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  //--------------------------------------------------
  // Handle OTP Input
  //--------------------------------------------------

  void _onChanged(
    String value,
    int index,
  ) {
    if (value.isNotEmpty &&
        index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final otp =
        _controllers.map((e) => e.text).join();

    widget.controller.text = otp;

    if (otp.length == _otpLength) {
      FocusScope.of(context).unfocus();
      widget.onCompleted?.call(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: List.generate(
        _otpLength,
        (index) {
          return SizedBox(
            width: 52,
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              autofocus: index == 0,
              textAlign: TextAlign.center,
              keyboardType:
                  TextInputType.number,
              textInputAction:
                  index == _otpLength - 1
                      ? TextInputAction.done
                      : TextInputAction.next,
              autofillHints: const [
                AutofillHints.oneTimeCode,
              ],
              maxLength: 1,
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly,
              ],
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor:
                    AppColors.background,
                contentPadding:
                    const EdgeInsets.symmetric(
                  vertical: AppSizes.spaceL,
                ),
                enabledBorder:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.radiusM,
                  ),
                  borderSide:
                      const BorderSide(
                    color: AppColors.border,
                  ),
                ),
                focusedBorder:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.radiusM,
                  ),
                  borderSide:
                      const BorderSide(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),
                errorBorder:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.radiusM,
                  ),
                  borderSide:
                      const BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.radiusM,
                  ),
                  borderSide:
                      const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty) {
                  return '';
                }

                return null;
              },
              onChanged: (value) =>
                  _onChanged(
                value,
                index,
              ),
            ),
          );
        },
      ),
    );
  }
}
