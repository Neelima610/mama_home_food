import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
// import '../../core/constants/constants.dart';
import '../../../models/category/category_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(category.name),
      ),

      body: Center(
        child: Text(
          category.name,
          style: Theme.of(context)
              .textTheme
              .headlineMedium,
        ),
      ),
    );
  }
}