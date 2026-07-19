// login_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../../shared/widgets/form_fields/phone_text_field.dart';
import '../helpers/auth_validator.dart';
import '../providers/auth_provider.dart';
import '../services/auth_service.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  //--------------------------------------------------
  // Form
  //--------------------------------------------------

  final _formKey =
      GlobalKey<FormState>();

  //--------------------------------------------------
  // Controller
  //--------------------------------------------------

  late final TextEditingController
      _phoneController;

  //--------------------------------------------------
  // Init
  //--------------------------------------------------

  @override
  void initState() {
    super.initState();

    _phoneController =
        TextEditingController();
  }

  //--------------------------------------------------
  // Dispose
  //--------------------------------------------------

  @override
  void dispose() {
    _phoneController.dispose();

    super.dispose();
  }

  //--------------------------------------------------
  // Continue
  //--------------------------------------------------

  Future<void> _continue() async {
    FocusScope.of(context).unfocus();

    //--------------------------------------------------
    // Validate Form
    //--------------------------------------------------

    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    //--------------------------------------------------
    // Provider
    //--------------------------------------------------

    final provider =
        context.read<AuthProvider>();

    //--------------------------------------------------
    // Phone Number
    //--------------------------------------------------

    final phone =
        _phoneController.text.trim();

    //--------------------------------------------------
    // Loading
    //--------------------------------------------------

    provider.setLoading(true);

    //--------------------------------------------------
    // Send OTP
    //--------------------------------------------------

    final success =
        await AuthService.sendOtp(
      phone,
    );

    //--------------------------------------------------
    // Stop Loading
    //--------------------------------------------------

    provider.setLoading(false);

    //--------------------------------------------------
    // Mounted Check
    //--------------------------------------------------

    if (!mounted) {
      return;
    }

    //--------------------------------------------------
    // Success
    //--------------------------------------------------

    if (success) {
      provider.setPhoneNumber(phone);

      provider.startOtpVerification();

      Navigator.pushNamed(
        context,
        RouteNames.otp,
      );

      return;
    }

    //--------------------------------------------------
    // Error
    //--------------------------------------------------

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          AppStrings.somethingWentWrong,
        ),
        duration:
            AppDurations.snackbar,
      ),
    );
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.all(
            AppSizes.screenPadding,
          ),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,

              children: [

                //--------------------------------------------------
                // Top Spacing
                //--------------------------------------------------

                const SizedBox(
                  height:
                      AppSizes.spaceXXL,
                ),

                //--------------------------------------------------
                // Header
                //--------------------------------------------------

                const LoginHeader(
                  title:
                      AppStrings
                          .welcomeBack,

                  subtitle:
                      AppStrings
                          .loginSubtitle,
                ),

                //--------------------------------------------------
                // Spacing
                //--------------------------------------------------

                const SizedBox(
                  height:
                      AppSizes.spaceXXXL,
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

                //--------------------------------------------------
                // Spacing
                //--------------------------------------------------

                const SizedBox(
                  height:
                      AppSizes.spaceXL,
                ),

                //--------------------------------------------------
                // Continue Button
                //--------------------------------------------------

                PrimaryButton(
                  text:
                      AppStrings
                          .continueButton,

                  icon:
                      Icons.arrow_forward,

                  isLoading:
                      provider.isLoading,

                  onPressed:
                      provider.isLoading
                          ? null
                          : _continue,
                ),

                //--------------------------------------------------
                // Forgot Password
                //--------------------------------------------------

                const SizedBox(
                  height:
                      AppSizes.spaceM,
                ),

                Align(
                  alignment:
                      Alignment.centerRight,

                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames
                            .forgotPassword,
                      );
                    },

                    child: const Text(
                      'Forgot Password?',
                    ),
                  ),
                ),

                //--------------------------------------------------
                // OR Divider
                //--------------------------------------------------

                const SizedBox(
                  height:
                      AppSizes.spaceL,
                ),

                Row(
                  children: [

                    const Expanded(
                      child: Divider(),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal:
                            AppSizes.spaceM,
                      ),

                      child: Text(
                        'OR',

                        style: Theme.of(
                          context,
                        )
                            .textTheme
                            .bodySmall,
                      ),
                    ),

                    const Expanded(
                      child: Divider(),
                    ),
                  ],
                ),

                //--------------------------------------------------
                // Signup Section
                //--------------------------------------------------

                const SizedBox(
                  height:
                      AppSizes.spaceL,
                ),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    Text(
                      "Don't have an account?",

                      style: Theme.of(
                        context,
                      )
                          .textTheme
                          .bodyMedium,
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.signup,
                        );
                      },

                      child: const Text(
                        'Create Account',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}