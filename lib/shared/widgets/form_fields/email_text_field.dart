import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class EmailTextField
extends StatelessWidget {
const EmailTextField({
super.key,
required this.controller,
this.validator,
});

final TextEditingController controller;

final String? Function(String?)?
validator;

@override
Widget build(BuildContext context) {
return TextFormField(
controller: controller,


  keyboardType:
      TextInputType.emailAddress,

  textInputAction:
      TextInputAction.next,

  autofillHints: const [
    AutofillHints.email,
  ],

  validator: validator,

  decoration: const InputDecoration(
    labelText: AppStrings.email,

    hintText: 'Enter your email address',

    prefixIcon: Icon(
      Icons.email_outlined,
    ),
  ),
);


}
}
