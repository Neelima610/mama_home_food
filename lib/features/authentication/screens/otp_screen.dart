
// otp_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/login_header.dart';
import '../widgets/otp_text_field.dart';
import '../widgets/resend_timer.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() =>
      _OtpScreenState();
}

class _OtpScreenState
    extends State<OtpScreen> {
  //--------------------------------------------------
  // Controller
  //--------------------------------------------------

  final TextEditingController
      _otpController =
      TextEditingController();

  //--------------------------------------------------
  // Dispose
  //--------------------------------------------------

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  //--------------------------------------------------
  // Verify OTP
  //--------------------------------------------------

  Future<void> _verifyOtp() async {
    FocusScope.of(context).unfocus();

    final provider =
        context.read<AuthProvider>();

    final otp =
        _otpController.text.trim();

    //--------------------------------------------------
    // Validate OTP
    //--------------------------------------------------

    if (otp.length != 6) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            AppStrings.invalidOtp,
          ),
          duration:
              AppDurations.snackbar,
        ),
      );

      return;
    }

    //--------------------------------------------------
    // Save OTP
    //--------------------------------------------------

    provider.setOtp(otp);

    //--------------------------------------------------
    // Verify OTP
    //--------------------------------------------------

    await provider.verifyOtp(otp);

    if (!mounted) {
      return;
    }

    //--------------------------------------------------
    // Error
    //--------------------------------------------------

    if (provider.hasError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            provider.errorMessage!,
          ),
          duration:
              AppDurations.snackbar,
        ),
      );

      return;
    }

    //--------------------------------------------------
    // Success
    //--------------------------------------------------

    if (provider.isAuthenticated) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.home,
        (route) => false,
      );
    }
  }

  //--------------------------------------------------
  // Resend OTP
  //--------------------------------------------------

 Future<void> _resendOtp() async {
  final provider =
      context.read<AuthProvider>();

  if (!provider.hasPhoneNumber) {
    return;
  }

  await provider.sendOtp();

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
        duration:
            AppDurations.snackbar,
      ),
    );

    return;
  }

  ScaffoldMessenger.of(context)
      .showSnackBar(
    const SnackBar(
      content: Text(
        AppStrings.otpSentAgain,
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
      appBar: const AuthAppBar(
        title:
            AppStrings.otpVerification,
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
                height:
                    AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Header
              //--------------------------------------------------

              LoginHeader(
                title:
                    AppStrings
                        .otpVerification,

                subtitle:
                    '${AppStrings.otpSent} '
                    '${AppStrings.countryCode} '
                    '${provider.phoneNumber}',
              ),

              const SizedBox(
                height:
                    AppSizes.spaceXXXL,
              ),

              //--------------------------------------------------
              // OTP Field
              //--------------------------------------------------

              OtpTextField(
                controller:
                    _otpController,

                onCompleted: (otp) {
                  provider.setOtp(otp);
                },
              ),

              const SizedBox(
                height:
                    AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Resend Timer
              //--------------------------------------------------

              ResendTimer(
                onResend:
                    _resendOtp,
              ),

              const SizedBox(
                height:
                    AppSizes.spaceXXXL,
              ),

              //--------------------------------------------------
              // Verify Button
              //--------------------------------------------------

              PrimaryButton(
                text:
                    AppStrings.verifyOtp,

                icon:
                    Icons.verified_rounded,

                isLoading:
                    provider.isLoading,

                onPressed:
                    provider.isLoading
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