
// forgot_password_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../../shared/widgets/form_fields/email_text_field.dart';
import '../helpers/auth_validator.dart';
import '../providers/auth_provider.dart';

class ForgotPasswordScreen
extends StatefulWidget {
const ForgotPasswordScreen({
super.key,
});

@override
State<ForgotPasswordScreen>
createState() =>
_ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
extends State<ForgotPasswordScreen> {
final _formKey =
GlobalKey<FormState>();

late final TextEditingController
_emailController;

@override
void initState() {
super.initState();


_emailController =
    TextEditingController();


}

@override
void dispose() {
_emailController.dispose();
super.dispose();
}

//--------------------------------------------------
// Reset Password
//--------------------------------------------------

Future<void> _resetPassword() async {
FocusScope.of(context).unfocus();


if (!_formKey.currentState!
    .validate()) {
  return;
}

final provider =
    context.read<AuthProvider>();

await provider.resetPassword(
  _emailController.text.trim(),
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

ScaffoldMessenger.of(context)
    .showSnackBar(
  const SnackBar(
    content: Text(
      'Password reset link sent to your email.',
    ),
  ),
);

Navigator.pop(context);


}

@override
Widget build(BuildContext context) {
final provider =
context.watch<AuthProvider>();


return Scaffold(
  appBar: AppBar(
    title: const Text(
      'Forgot Password',
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
              height: AppSizes.spaceXXL,
            ),

            Icon(
              Icons.lock_reset_rounded,
              size: AppSizes.logoM,
              color: Theme.of(context)
                  .colorScheme
                  .primary,
            ),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            Text(
              'Forgot your password?',
              textAlign:
                  TextAlign.center,

              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                    fontWeight:
                        FontWeight.bold,
                  ),
            ),

            const SizedBox(
              height: AppSizes.spaceS,
            ),

            Text(
              'Enter your registered email address '
              'and we will send you a password reset link.',
              textAlign:
                  TextAlign.center,

              style: Theme.of(context)
                  .textTheme
                  .bodyMedium,
            ),

            const SizedBox(
              height: AppSizes.spaceXXL,
            ),

            EmailTextField(
              controller:
                  _emailController,

              validator:
                  AuthValidator
                      .validateEmail,
            ),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            PrimaryButton(
              text: 'Send Reset Link',
              icon:
                  Icons.email_outlined,

              isLoading:
                  provider.isLoading,

              onPressed:
                  provider.isLoading
                      ? null
                      : _resetPassword,
            ),
          ],
        ),
      ),
    ),
  ),
);


}
}
