import 'dart:async';

import 'package:flutter/material.dart';
import '../../../shared/widgets/common/app_loader.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/routes.dart';
import '../../../shared/widgets/common/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _fadeAnimation;

  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scaleAnimation = Tween<double>(
      begin: 0.80,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Timer(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, RouteNames.navigation,);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Soft Glow
                    Container(
                      width: AppSizes.splashGlowSize,
                      height: AppSizes.splashGlowSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 80,
                            spreadRadius: 20,
                          ),
                        ],
                      ),
                    ),

                    // Logo
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: const AppLogo(),
                    ),
                    const SizedBox(height: AppSizes.splashTitleSpacing),

                    // App Name
                    Text(
                      AppConstants.appName,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            color: AppColors.textLight,
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: AppSizes.splashSubtitleSpacing),

                    // Tagline
                    Text(
                      AppStrings.tagline,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.textLight.withValues(),
                      ),
                    ),

                    const SizedBox(height: AppSizes.splashLoaderSpacing),

                    const AppLoader(),
                  ],
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: AppSizes.splashBottomPadding,
                child: Center(
                  child: Text(
                    AppStrings.madeWithLove,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textLight.withOpacity(0.75),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
