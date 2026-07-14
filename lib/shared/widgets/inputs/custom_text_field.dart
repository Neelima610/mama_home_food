import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.showPasswordToggle = false,
    this.autofocus = false,
    this.filled = true,
    this.fillColor,
    this.borderRadius,
    this.contentPadding,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;

  final IconData? prefixIcon;
  final Widget? suffixIcon;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final FormFieldValidator<String>? validator;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;

  final int maxLines;
  final int? minLines;
  final int? maxLength;

  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final bool showPasswordToggle;
  final bool autofocus;
  final bool filled;

  final Color? fillColor;

  final double? borderRadius;

  final EdgeInsetsGeometry? contentPadding;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();

    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,

      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,

      validator: widget.validator,

      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,

      maxLines: widget.obscureText ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,

      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      enabled: widget.enabled,

      obscureText: _obscure,

      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),

      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,

        counterText: "",

        filled: widget.filled,

        fillColor: widget.fillColor ?? AppColors.card,

        contentPadding:
            widget.contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),

        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(
                widget.prefixIcon,
                color: AppColors.primary,
              ),

        suffixIcon: widget.showPasswordToggle
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                icon: Icon(
                  _obscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              )
            : widget.suffixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ??
                AppSizes.radiusLarge,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ??
                AppSizes.radiusLarge,
          ),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ??
                AppSizes.radiusLarge,
          ),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ??
                AppSizes.radiusLarge,
          ),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ??
                AppSizes.radiusLarge,
          ),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
      ),
    );
  }
}