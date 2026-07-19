import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../models/category/category_model.dart';
import '../providers/category_provider.dart';
import '../widgets/category_header.dart';
import '../widgets/category_product_grid.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}


class _CategoryScreenState extends State<CategoryScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      if (!mounted) return;

      context.read<CategoryProvider>().loadProducts(
        widget.category.id,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.name,
        ),
        centerTitle: true,
      ),

      body: Consumer<CategoryProvider>(
        builder: (context, provider, child) {

          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }


          if (provider.products.isEmpty) {
            return const Center(
              child: Text(
                "No products available",
              ),
            );
          }


          return SingleChildScrollView(
            padding: const EdgeInsets.all(
              AppSizes.screenPadding,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                CategoryHeader(
                  category: widget.category,
                  totalProducts: provider.products.length,
                ),


                const SizedBox(
                  height: AppSizes.spaceL,
                ),


                CategoryProductGrid(
                  products: provider.products,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}