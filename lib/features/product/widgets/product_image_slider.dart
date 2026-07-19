import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../models/product/product_model.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
    this.height,
    this.onImageTap,
  });

  final ProductModel product;

  final double? height;

  final VoidCallback? onImageTap;

  @override
  State<ProductImageSlider> createState() =>
      _ProductImageSliderState();
}

class _ProductImageSliderState
    extends State<ProductImageSlider> {
  late final PageController _pageController;

  int _currentPage = 0;

  List<String> get _images {
    if (widget.product.images.isNotEmpty) {
      return widget.product.images;
    }

    return [widget.product.image];
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ??
          MediaQuery.of(context).size.height * 0.38,
      child: Stack(
        children: [
          _buildPageView(),

          if (_images.length > 1)
            _buildPageIndicator(),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: _images.length,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: widget.onImageTap,
          child: Hero(
            tag: index == 0
                ? 'product-image-${widget.product.id}'
                : 'product-image-${widget.product.id}-$index',
            child: _buildImage(
              _images[index],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImage(String imagePath) {
    return Image.asset(
      imagePath,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return Container(
          color: AppColors.background,
          alignment: Alignment.center,
          child: const Icon(
            Icons.fastfood_rounded,
            size: 70,
            color: AppColors.primary,
          ),
        );
      },
    );
  }

  Widget _buildPageIndicator() {
    return Positioned(
      bottom: AppSizes.spaceM,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: List.generate(
          _images.length,
          (index) {
            final isSelected =
                index == _currentPage;

            return AnimatedContainer(
              duration:
                  AppDurations.animationDuration,
              margin:
                  const EdgeInsets.symmetric(
                horizontal: 3,
              ),
              width: isSelected ? 22 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.white,
                borderRadius:
                    BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 4,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}