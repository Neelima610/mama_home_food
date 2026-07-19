import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.validator,
    this.labelText = 'Password',
    this.hintText,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController controller;

  final String? Function(String?)? validator;

  final String labelText;

  final String? hintText;

  final TextInputAction textInputAction;

  @override
  State<PasswordTextField> createState() =>
      _PasswordTextFieldState();
}

class _PasswordTextFieldState
    extends State<PasswordTextField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,

      obscureText: _obscureText,

      textInputAction:
          widget.textInputAction,

      validator: widget.validator,

      decoration: InputDecoration(
        labelText: widget.labelText,

        hintText: widget.hintText,

        prefixIcon: const Icon(
          Icons.lock_outline,
        ),

        suffixIcon: IconButton(
          onPressed: _toggleVisibility,

          icon: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
        ),
      ),
    );
  }
}