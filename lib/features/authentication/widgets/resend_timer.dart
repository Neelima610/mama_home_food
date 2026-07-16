
// resend_timer.dart
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class ResendTimer extends StatefulWidget {
  const ResendTimer({
    super.key,
    required this.onResend,
    this.duration = 30,
  });

  final VoidCallback onResend;
  final int duration;

  @override
  State<ResendTimer> createState() =>
      _ResendTimerState();
}

class _ResendTimerState
    extends State<ResendTimer> {
  Timer? _timer;

  late int _secondsRemaining;

  @override
  void initState() {
    super.initState();

    _secondsRemaining = widget.duration;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (_secondsRemaining <= 1) {
          _timer?.cancel();

          setState(() {
            _secondsRemaining = 0;
          });
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

 Future<void> _resendOtp() async {
  await Future.sync(widget.onResend);

  if (!mounted) return;


    setState(() {
      _secondsRemaining = widget.duration;
    });

    _startTimer();
  }

  String get _formattedTime {
    final minutes = (_secondsRemaining ~/ 60)
        .toString()
        .padLeft(2, '0');

    final seconds = (_secondsRemaining % 60)
        .toString()
        .padLeft(2, '0');

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.didNotReceiveCode,
          style: AppTextStyles.bodyMedium,
          textAlign: TextAlign.center,
        ),

        const SizedBox(
          height: AppSizes.spaceS,
        ),

        AnimatedSwitcher(
          duration: AppDurations.shortAnimation,
          child: _secondsRemaining > 0
              ? Text(
                  '${AppStrings.resendOtpIn} $_formattedTime',
                  key: const ValueKey('timer'),
                  style: AppTextStyles.bodyMedium,
                  textAlign: TextAlign.center,
                )
              : TextButton(
                  key: const ValueKey('button'),
                  onPressed: _resendOtp,
                  child: Text(
                    AppStrings.resendOtp,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}