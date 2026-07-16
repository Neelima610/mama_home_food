import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

final String? Function(String?)?
    validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      maxLength: 10,
      onChanged: onChanged,
      validator: validator,

      decoration: InputDecoration(
        labelText: AppStrings.mobileNumber,
        hintText: AppStrings.enterPhoneNumber,

        prefixIcon: Container(
          width: 70,
          alignment: Alignment.center,
          child: const Text(
            "+91",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),

        counterText: "",

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.radiusLarge,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.radiusLarge,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.radiusLarge,
          ),
        ),
      ),
    );
  }
}