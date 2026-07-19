import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/inputs/custom_text_field.dart';
import '../helpers/profile_validator.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
  });

  final TextEditingController firstNameController;

  final TextEditingController lastNameController;

  final TextEditingController emailController;

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: firstNameController,
          labelText: AppStrings.firstName,
          validator:
              ProfileValidator.validateFirstName,
        ),

        const SizedBox(
          height: AppSizes.spaceM,
        ),

        CustomTextField(
          controller: lastNameController,
          labelText: AppStrings.lastName,
          validator:
              ProfileValidator.validateLastName,
        ),

        const SizedBox(
          height: AppSizes.spaceM,
        ),

        CustomTextField(
          controller: emailController,
          labelText: AppStrings.email,
          keyboardType:
              TextInputType.emailAddress,
          validator:
              ProfileValidator.validateEmail,
        ),

        const SizedBox(
          height: AppSizes.spaceM,
        ),

        CustomTextField(
          controller: phoneController,
          labelText:
              AppStrings.phone,
          keyboardType:
              TextInputType.phone,
          validator:
              ProfileValidator.validatePhoneNumber,
        ),
      ],
    );
  }
}