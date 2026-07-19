// product_gallery_screen.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../models/product/product_model.dart';

class ProductGalleryScreen extends StatefulWidget {
  const ProductGalleryScreen({
    super.key,
    required this.product,
    this.initialIndex = 0,
  });

  final ProductModel product;
  final int initialIndex;

  @override
  State<ProductGalleryScreen> createState() =>
      _ProductGalleryScreenState();
}

class _ProductGalleryScreenState
    extends State<ProductGalleryScreen> {
  late final PageController _pageController;

  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.initialIndex;

    _pageController = PageController(
      initialPage: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = _getImages();

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          '${_currentIndex + 1} / ${images.length}',
        ),
      ),

      body: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (
          context,
          index,
        ) {
          return InteractiveViewer(
            minScale: 1,
            maxScale: 4,
            child: Center(
              child: Image.asset(
                images[index],
                fit: BoxFit.contain,
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return const Icon(
                    Icons.broken_image_outlined,
                    color: AppColors.white,
                    size: 60,
                  );
                },
              ),
            ),
          );
        },
      ),

      bottomNavigationBar:
          _buildThumbnailBar(images),
    );
  }

  Widget _buildThumbnailBar(
    List<String> images,
  ) {
    return SafeArea(
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spaceM,
          vertical: AppSizes.spaceS,
        ),
        color: Colors.black,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          separatorBuilder: (_, _) =>
              const SizedBox(
            width: AppSizes.spaceS,
          ),
          itemBuilder: (
            context,
            index,
          ) {
            final isSelected =
                index == _currentIndex;

            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: AppDurations
                      .animationDuration,
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 64,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.radiusS,
                  ),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                clipBehavior:
                    Clip.antiAlias,
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<String> _getImages() {
    if (widget.product.images.isNotEmpty) {
      return widget.product.images;
    }

    return [
      widget.product.image,
    ];
  }
}