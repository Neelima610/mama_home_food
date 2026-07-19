import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/buttons/custom_button.dart';


class SaveAddressButton extends StatelessWidget {
  const SaveAddressButton({
    super.key,
    required this.onPressed,
    this.text = AppStrings.saveAddress,
    this.isLoading = false,
  });


  final VoidCallback onPressed;
  final String text;
  final bool isLoading;


  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
    );
  }
}