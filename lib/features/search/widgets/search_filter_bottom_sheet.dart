import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class SearchFilterBottomSheet extends StatefulWidget {
  const SearchFilterBottomSheet({
    super.key,
    required this.isVegOnly,
    required this.offersOnly,
    required this.minRating,
    required this.onApply,
  });

  final bool isVegOnly;

  final bool offersOnly;

  final double minRating;

  final Function(
    bool isVegOnly,
    bool offersOnly,
    double minRating,
  ) onApply;

  @override
  State<SearchFilterBottomSheet> createState() =>
      _SearchFilterBottomSheetState();
}

class _SearchFilterBottomSheetState
    extends State<SearchFilterBottomSheet> {
  late bool _isVegOnly;

  late bool _offersOnly;

  late double _minRating;

  @override
  void initState() {
    super.initState();

    _isVegOnly = widget.isVegOnly;

    _offersOnly = widget.offersOnly;

    _minRating = widget.minRating;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceL,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Text(
                  'Filters',

                  style:
                      AppTextStyles.titleLarge.copyWith(
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  icon: const Icon(
                    Icons.close_rounded,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            SwitchListTile(
              contentPadding:
                  EdgeInsets.zero,

              title: const Text(
                'Vegetarian Only',
              ),

              value: _isVegOnly,

              activeColor:
                  AppColors.primary,

              onChanged: (value) {
                setState(() {
                  _isVegOnly = value;
                });
              },
            ),

            SwitchListTile(
              contentPadding:
                  EdgeInsets.zero,

              title: const Text(
                'Offers Only',
              ),

              value: _offersOnly,

              activeColor:
                  AppColors.primary,

              onChanged: (value) {
                setState(() {
                  _offersOnly = value;
                });
              },
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            Text(
              'Minimum Rating',

              style:
                  AppTextStyles.titleMedium.copyWith(
                fontWeight:
                    FontWeight.w600,
              ),
            ),

            Slider(
              value: _minRating,

              min: 0,

              max: 5,

              divisions: 5,

              activeColor:
                  AppColors.primary,

              label:
                  '${_minRating.toStringAsFixed(1)} ⭐',

              onChanged: (value) {
                setState(() {
                  _minRating = value;
                });
              },
            ),

            Center(
              child: Text(
                '${_minRating.toStringAsFixed(1)} ⭐ and above',

                style:
                    AppTextStyles.bodySmall,
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            SizedBox(
              width: double.infinity,

              height: AppSizes.buttonHeight,

              child: ElevatedButton(
                onPressed: () {
                  widget.onApply(
                    _isVegOnly,
                    _offersOnly,
                    _minRating,
                  );

                  Navigator.pop(context);
                },

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.primary,

                  foregroundColor:
                      AppColors.white,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      AppSizes.radiusM,
                    ),
                  ),
                ),

                child: const Text(
                  'Apply Filters',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}