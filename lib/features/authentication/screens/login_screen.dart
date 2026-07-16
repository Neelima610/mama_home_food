
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
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final provider = context.read<AuthProvider>();

    provider.setLoading(true);

    final phone = _phoneController.text.trim();

    final success = await AuthService.sendOtp(phone);

    provider.setLoading(false);

    if (!mounted) return;

    if (success) {
      provider.setPhoneNumber(phone);
      provider.setOtpSent(true);

      Navigator.pushNamed(
        context,
        RouteNames.otp,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            AppStrings.somethingWentWrong,
          ),
          duration: AppDurations.snackbar,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
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
                  height: AppSizes.spaceXXL,
                ),

                //--------------------------------------------------
                // Header
                //--------------------------------------------------

                const LoginHeader(
                  title: AppStrings.welcomeBack,
                  subtitle: AppStrings.loginSubtitle,
                ),

                const SizedBox(
                  height: AppSizes.spaceXXXL,
                ),

                //--------------------------------------------------
                // Phone Number
                //--------------------------------------------------

                PhoneTextField(
                  controller: _phoneController,
                  validator: AuthValidator.validatePhone,
                ),

                const SizedBox(
                  height: AppSizes.spaceXL,
                ),

                //--------------------------------------------------
                // Continue Button
                //--------------------------------------------------

                PrimaryButton(
                  text: AppStrings.continueButton,
                  isLoading: provider.isLoading,
                  icon: Icons.arrow_forward,
                  onPressed: provider.isLoading
                      ? null
                      : _continue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
