// write_review_screen.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';
import '../../../shared/widgets/feedback/app_snackbar.dart';

import '../widgets/product_app_bar.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<WriteReviewScreen> createState() =>
      _WriteReviewScreenState();
}

class _WriteReviewScreenState
    extends State<WriteReviewScreen> {
  final _formKey = GlobalKey<FormState>();

  final _reviewController =
      TextEditingController();

  int _rating = 0;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: ProductAppBar(
        title: AppStrings.writeReview,
        showFavorite: false,
        showShare: false,
      ),

      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(
            AppSizes.spaceM,
          ),
          children: [
            _buildProductHeader(),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            _buildRatingSection(),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            _buildReviewField(),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductHeader() {
    return Row(
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(
            AppSizes.radiusM,
          ),
          child: Image.asset(
            widget.product.image,
            width: 72,
            height: 72,
            fit: BoxFit.cover,
            errorBuilder: (
              context,
              error,
              stackTrace,
            ) {
              return Container(
                width: 72,
                height: 72,
                color: AppColors.card,
                child: const Icon(
                  Icons.fastfood_rounded,
                  color: AppColors.primary,
                ),
              );
            },
          ),
        ),

        const SizedBox(
          width: AppSizes.spaceM,
        ),

        Expanded(
          child: Text(
            widget.product.name,
            maxLines: 2,
            overflow:
                TextOverflow.ellipsis,
            style: AppTextStyles.titleMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.yourRating,
          style: AppTextStyles.heading3,
        ),

        const SizedBox(
          height: AppSizes.spaceM,
        ),

        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) {
              final starNumber = index + 1;

              return IconButton(
                onPressed: () {
                  setState(() {
                    _rating = starNumber;
                  });
                },
                icon: Icon(
                  starNumber <= _rating
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  size: 42,
                  color: AppColors.rating,
                ),
              );
            },
          ),
        ),

        if (_rating > 0)
          Center(
            child: Text(
              '$_rating / 5',
              style: AppTextStyles.titleMedium,
            ),
          ),
      ],
    );
  }

  Widget _buildReviewField() {
    return TextFormField(
      controller: _reviewController,
      maxLines: 6,
      textInputAction:
          TextInputAction.newline,
      decoration: InputDecoration(
        labelText: AppStrings.yourReview,
        hintText:
            AppStrings.reviewHint,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(
            AppSizes.radiusM,
          ),
        ),
      ),
      validator: (value) {
        if (value == null ||
            value.trim().isEmpty) {
          return AppStrings
              .reviewRequired;
        }

        if (value.trim().length < 10) {
          return AppStrings
              .reviewTooShort;
        }

        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        onPressed: _submitReview,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColors.primary,
          foregroundColor:
              AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
              AppSizes.radiusM,
            ),
          ),
        ),
        child: Text(
          AppStrings.submitReview,
          style: AppTextStyles.button,
        ),
      ),
    );
  }

  void _submitReview() {
    if (_rating == 0) {
      AppSnackbar.showError(
        context,
        AppStrings.selectRating,
      );
      return;
    }

    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    // Save review through repository/provider
    // after ReviewModel and review storage
    // are implemented.

    AppSnackbar.showSuccess(
      context,
      AppStrings.reviewSubmitted,
    );

    Navigator.pop(context);
  }
}