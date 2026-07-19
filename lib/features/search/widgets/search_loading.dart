import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(
          AppSizes.spaceXL,
        ),

        child: CircularProgressIndicator(),
      ),
    );
  }
}