import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/buttons/custom_button.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../providers/profile_provider.dart';
import '../widgets/edit_profile_form.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState
    extends State<EditProfileScreen> {
  //--------------------------------------------------
  // Form
  //--------------------------------------------------

  final _formKey =
      GlobalKey<FormState>();

  //--------------------------------------------------
  // Controllers
  //--------------------------------------------------

  late final TextEditingController
      _firstNameController;

  late final TextEditingController
      _lastNameController;

  late final TextEditingController
      _emailController;

  late final TextEditingController
      _phoneController;

  @override
  void initState() {
    super.initState();

    final user =
        context.read<ProfileProvider>().user;

    _firstNameController =
        TextEditingController(
      text: user?.firstName ?? '',
    );

    _lastNameController =
        TextEditingController(
      text: user?.lastName ?? '',
    );

    _emailController =
        TextEditingController(
      text: user?.email ?? '',
    );

    _phoneController =
        TextEditingController(
      text: user?.phoneNumber ?? '',
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();

    _lastNameController.dispose();

    _emailController.dispose();

    _phoneController.dispose();

    super.dispose();
  }

  //--------------------------------------------------
  // Save
  //--------------------------------------------------

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    final provider =
        context.read<ProfileProvider>();

    await provider.updateProfile(
      firstName:
          _firstNameController.text.trim(),
      lastName:
          _lastNameController.text.trim(),
      email:
          _emailController.text.trim(),
      phoneNumber:
          _phoneController.text.trim(),
    );

    if (!mounted) {
      return;
    }

    if (!provider.hasError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Profile Updated Successfully',
          ),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (
        context,
        provider,
        child,
      ) {
        return Scaffold(
          appBar: const CustomAppBar(
            title:
                AppStrings.editProfile,
            showBackButton: true,
          ),

          body: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.all(
                  AppSizes.spaceL,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .stretch,
                  children: [
                    EditProfileForm(
                      firstNameController:
                          _firstNameController,
                      lastNameController:
                          _lastNameController,
                      emailController:
                          _emailController,
                      phoneController:
                          _phoneController,
                    ),

                    const SizedBox(
                      height:
                          AppSizes.spaceXL,
                    ),

                    CustomButton(
                      text:
                          AppStrings.save,
                      isLoading:
                          provider.isSaving,
                      onPressed:
                          _saveProfile,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}