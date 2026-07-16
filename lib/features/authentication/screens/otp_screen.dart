
// otp_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../providers/auth_provider.dart';
import '../services/auth_service.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/login_header.dart';
import '../widgets/otp_text_field.dart';
import '../widgets/resend_timer.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final TextEditingController _otpController;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _verifyOtp() async {
    FocusScope.of(context).unfocus();

    final provider = context.read<AuthProvider>();

    provider.setLoading(true);

    final success = await AuthService.verifyOtp(
      _otpController.text.trim(),
    );

    provider.setLoading(false);

    if (!mounted) return;

    if (success) {
      provider.login();

      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.home,
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            AppStrings.invalidOtp,
          ),
          duration: AppDurations.snackbar,
        ),
      );
    }
  }

  Future<void> _resendOtp() async {
    final authProvider = context.read<AuthProvider>();

    await AuthService.sendOtp(
      authProvider.phoneNumber,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          AppStrings.otpSentAgain,
        ),
        duration: AppDurations.snackbar,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: const AuthAppBar(
        title: AppStrings.otpVerification,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Header
              //--------------------------------------------------

              LoginHeader(
                title: AppStrings.otpVerification,
                subtitle:
                    "${AppStrings.otpSent} +91 ${authProvider.phoneNumber}",
              ),

              const SizedBox(
                height: AppSizes.spaceXXXL,
              ),

              //--------------------------------------------------
              // OTP TextField
              //--------------------------------------------------

              OtpTextField(
                controller: _otpController,
              ),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Resend OTP
              //--------------------------------------------------

              ResendTimer(
                onResend: _resendOtp,
              ),

              const SizedBox(
                height: AppSizes.spaceXXXL,
              ),

              //--------------------------------------------------
              // Verify Button
              //--------------------------------------------------

              PrimaryButton(
                text: AppStrings.verifyOtp,
                isLoading: authProvider.isLoading,
                icon: Icons.verified_rounded,
                onPressed: authProvider.isLoading
                    ? null
                    : _verifyOtp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
