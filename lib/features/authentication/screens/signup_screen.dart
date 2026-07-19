
// sign_up_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../../shared/widgets/form_fields/email_text_field.dart';
import '../../../shared/widgets/form_fields/phone_text_field.dart';
import '../helpers/auth_validator.dart';
import '../providers/auth_provider.dart';
import '../widgets/login_header.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    super.key,
  });

  @override
  State<SignupScreen> createState() =>
      _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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

  late final TextEditingController
      _passwordController;

  late final TextEditingController
      _confirmPasswordController;

  //--------------------------------------------------
  // Password Visibility
  //--------------------------------------------------

  bool _isPasswordVisible = false;

  bool _isConfirmPasswordVisible = false;

  //--------------------------------------------------
  // Init
  //--------------------------------------------------

  @override
  void initState() {
    super.initState();

    _firstNameController =
        TextEditingController();

    _lastNameController =
        TextEditingController();

    _emailController =
        TextEditingController();

    _phoneController =
        TextEditingController();

    _passwordController =
        TextEditingController();

    _confirmPasswordController =
        TextEditingController();
  }

  //--------------------------------------------------
  // Dispose
  //--------------------------------------------------

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  //--------------------------------------------------
  // Signup
  //--------------------------------------------------

  Future<void> _signup() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final provider =
        context.read<AuthProvider>();

    await provider.signup(
      firstName:
          _firstNameController.text.trim(),

      lastName:
          _lastNameController.text.trim(),

      email:
          _emailController.text.trim(),

      phoneNumber:
          _phoneController.text.trim(),

      password:
          _passwordController.text,
    );

    if (!mounted) {
      return;
    }

    if (provider.hasError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            provider.errorMessage!,
          ),
        ),
      );

      return;
    }

    if (provider.isAuthenticated) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.home,
        (route) => false,
      );
    }
  }

  //--------------------------------------------------
  // Build
  //--------------------------------------------------

  @override
  Widget build(
    BuildContext context,
  ) {
    final provider =
        context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,

              children: [

                const SizedBox(
                  height:
                      AppSizes.spaceXL,
                ),

                //--------------------------------------------------
                // Header
                //--------------------------------------------------

                const LoginHeader(
                  title:
                      'Create your account',

                  subtitle:
                      'Join us and enjoy delicious homemade food.',
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceXXL,
                ),

                //--------------------------------------------------
                // First Name
                //--------------------------------------------------

                TextFormField(
                  controller:
                      _firstNameController,

                  textInputAction:
                      TextInputAction.next,

                  textCapitalization:
                      TextCapitalization.words,

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Please enter your first name';
                    }

                    return null;
                  },

                  decoration:
                      const InputDecoration(
                    labelText:
                        'First Name',

                    prefixIcon:
                        Icon(
                      Icons.person_outline,
                    ),
                  ),
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceL,
                ),

                //--------------------------------------------------
                // Last Name
                //--------------------------------------------------

                TextFormField(
                  controller:
                      _lastNameController,

                  textInputAction:
                      TextInputAction.next,

                  textCapitalization:
                      TextCapitalization.words,

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Please enter your last name';
                    }

                    return null;
                  },

                  decoration:
                      const InputDecoration(
                    labelText:
                        'Last Name',

                    prefixIcon:
                        Icon(
                      Icons.person_outline,
                    ),
                  ),
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceL,
                ),

                //--------------------------------------------------
                // Email
                //--------------------------------------------------

                EmailTextField(
                  controller:
                      _emailController,

                  validator:
                      AuthValidator
                          .validateEmail,
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceL,
                ),

                //--------------------------------------------------
                // Phone Number
                //--------------------------------------------------

                PhoneTextField(
                  controller:
                      _phoneController,

                  validator:
                      AuthValidator
                          .validatePhone,
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceL,
                ),

                //--------------------------------------------------
                // Password
                //--------------------------------------------------

                TextFormField(
                  controller:
                      _passwordController,

                  obscureText:
                      !_isPasswordVisible,

                  textInputAction:
                      TextInputAction.next,

                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return 'Please enter a password';
                    }

                    if (value.length < 8) {
                      return
                          'Password must be at least 8 characters';
                    }

                    return null;
                  },

                  decoration:
                      InputDecoration(
                    labelText:
                        'Password',

                    prefixIcon:
                        const Icon(
                      Icons.lock_outline,
                    ),

                    suffixIcon:
                        IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible =
                              !_isPasswordVisible;
                        });
                      },

                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceL,
                ),

                //--------------------------------------------------
                // Confirm Password
                //--------------------------------------------------

                TextFormField(
                  controller:
                      _confirmPasswordController,

                  obscureText:
                      !_isConfirmPasswordVisible,

                  textInputAction:
                      TextInputAction.done,

                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return
                          'Please confirm your password';
                    }

                    if (value !=
                        _passwordController.text) {
                      return
                          'Passwords do not match';
                    }

                    return null;
                  },

                  onFieldSubmitted: (_) {
                    if (!provider.isLoading) {
                      _signup();
                    }
                  },

                  decoration:
                      InputDecoration(
                    labelText:
                        'Confirm Password',

                    prefixIcon:
                        const Icon(
                      Icons.lock_outline,
                    ),

                    suffixIcon:
                        IconButton(
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },

                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceXL,
                ),

                //--------------------------------------------------
                // Create Account
                //--------------------------------------------------

                PrimaryButton(
                  text:
                      'Create Account',

                  icon:
                      Icons.person_add_alt_1,

                  isLoading:
                      provider.isLoading,

                  onPressed:
                      provider.isLoading
                          ? null
                          : _signup,
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceL,
                ),

                //--------------------------------------------------
                // Login
                //--------------------------------------------------

                TextButton(
                  onPressed:
                      provider.isLoading
                          ? null
                          : () {
                              Navigator.pop(
                                context,
                              );
                            },

                  child: const Text(
                    'Already have an account? Login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}