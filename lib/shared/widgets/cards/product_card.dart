
// product_card.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_text_styles.dart';

import '../../../features/cart/providers/cart_provider.dart';
import '../../../models/product/product_model.dart';

import '../favorite_button.dart';


class ProductCard extends StatelessWidget {

  const ProductCard({
    super.key,
    required this.product,
  });


  final ProductModel product;


  @override
  Widget build(BuildContext context) {


    return RepaintBoundary(

      child: Consumer<CartProvider>(

        builder: (_, cart, _) {


          final quantity =
              cart.getQuantity(product.id);



          return Material(

            color:
                Colors.transparent,


            child: InkWell(

              borderRadius:
                  BorderRadius.circular(
                AppSizes.radiusL,
              ),


              splashColor:
                  AppColors.primary.withOpacity(
                    0.15,
                  ),



              onTap: () {


                Navigator.pushNamed(

                  context,

                  RouteNames.product,

                  arguments:
                      product,

                );

              },



              child: Card(


                elevation:
                    AppNumbers.cardElevation,


                shadowColor:
                    AppColors.shadow,



                color:
                    AppColors.card,



                shape:
                    RoundedRectangleBorder(

                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.radiusL,
                  ),

                ),



                clipBehavior:
                    Clip.antiAlias,



                child: Column(


                  crossAxisAlignment:
                      CrossAxisAlignment.start,



                  children: [



                    Expanded(

                      flex: 6,


                      child: Stack(

                        fit:
                            StackFit.expand,


                        children: [



                          _buildImage(),



                          _buildTopBadges(),



                          Positioned(


                            top:
                                AppSizes.spaceS,


                            right:
                                AppSizes.spaceS,



                            child:
                                FavoriteButton(

                              product:
                                  product,


                              size:
                                  36,


                              iconSize:
                                  18,

                            ),

                          ),



                          if (!product.isAvailable)

                            _buildOutOfStock(),


                        ],
                      ),
                    ),




                    Expanded(


                      flex: 5,


                      child: Padding(


                        padding:
                            const EdgeInsets.all(
                          AppSizes.spaceM,
                        ),



                        child: Column(


                          crossAxisAlignment:
                              CrossAxisAlignment.start,



                          children: [



                            _buildTitle(),



                            const SizedBox(

                              height:
                                  AppSizes.spaceXS,

                            ),



                            _buildSubtitle(),



                            const Spacer(),



                            _buildRating(),



                            const SizedBox(

                              height:
                                  AppSizes.spaceS,

                            ),



                            _buildPrice(),



                            const SizedBox(

                              height:
                                  AppSizes.spaceM,

                            ),




                            _buildBottomButton(

                              context,

                              cart,

                              quantity,

                            ),



                          ],
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }



  Widget _buildImage() {


    return Hero(


      tag:
          'product-image-${product.id}',



      child: Image.asset(


        product.image,



        width:
            double.infinity,



        fit:
            BoxFit.cover,



        errorBuilder:
            (
            context,
            error,
            stackTrace,
            ) {


          return Container(


            color:
                AppColors.background,



            alignment:
                Alignment.center,



            child:
                const Icon(


              Icons.fastfood_rounded,


              size:
                  50,


              color:
                  AppColors.primary,


            ),
          );
        },
      ),
    );
  }
    Widget _buildTopBadges() {

    return Positioned(

      top:
          AppSizes.spaceS,


      left:
          AppSizes.spaceS,


      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,


        children: [


          _buildVegIndicator(),



          if (product.isFeatured) ...[

            const SizedBox(
              height:
                  AppSizes.spaceXS,
            ),


            _buildFeaturedBadge(),

          ],



          if (_hasDiscount) ...[

            const SizedBox(
              height:
                  AppSizes.spaceXS,
            ),


            _buildDiscountBadge(),

          ],


        ],
      ),
    );
  }





  Widget _buildVegIndicator() {


    return Container(


      width:
          18,


      height:
          18,


      padding:
          const EdgeInsets.all(2),



      decoration:
          BoxDecoration(


        color:
            AppColors.white,


        border:
            Border.all(

          color: product.isVeg
              ? AppColors.veg
              : AppColors.nonVeg,

        ),



        borderRadius:
            BorderRadius.circular(4),

      ),



      child:
          DecoratedBox(


        decoration:
            BoxDecoration(


          color: product.isVeg
              ? AppColors.veg
              : AppColors.nonVeg,


          shape:
              BoxShape.circle,

        ),
      ),
    );
  }





  Widget _buildFeaturedBadge() {


    return Container(


      padding:
          const EdgeInsets.symmetric(

        horizontal:
            8,

        vertical:
            4,

      ),



      decoration:
          BoxDecoration(


        color:
            AppColors.primary,


        borderRadius:
            BorderRadius.circular(
          AppSizes.radiusS,
        ),

      ),



      child:
          const Text(


        "BESTSELLER",


        style:
            TextStyle(


          color:
              AppColors.white,


          fontSize:
              10,


          fontWeight:
              FontWeight.w700,

        ),
      ),
    );
  }





  Widget _buildDiscountBadge() {


    return Container(


      padding:
          const EdgeInsets.symmetric(

        horizontal:
            8,

        vertical:
            4,

      ),



      decoration:
          BoxDecoration(


        color:
            AppColors.offer,


        borderRadius:
            BorderRadius.circular(
          AppSizes.radiusS,
        ),

      ),



      child:
          Text(


        "$discountPercentage% OFF",


        style:
            const TextStyle(


          color:
              AppColors.white,


          fontSize:
              10,


          fontWeight:
              FontWeight.bold,

        ),
      ),
    );
  }





  Widget _buildOutOfStock() {


    return Positioned.fill(


      child:
          Container(


        color:
            Colors.black45,



        alignment:
            Alignment.center,



        child:
            Container(


          padding:
              const EdgeInsets.symmetric(

            horizontal:
                14,

            vertical:
                6,

          ),



          decoration:
              BoxDecoration(


            color:
                AppColors.error,


            borderRadius:
                BorderRadius.circular(
              AppSizes.radiusM,
            ),

          ),



          child:
              const Text(


            "OUT OF STOCK",



            style:
                TextStyle(


              color:
                  AppColors.white,


              fontWeight:
                  FontWeight.bold,

            ),
          ),
        ),
      ),
    );
  }





  bool get _hasDiscount =>

      product.oldPrice != null &&

      product.oldPrice! > product.price;




  int get discountPercentage {


    if (!_hasDiscount) return 0;



    return (((product.oldPrice! -
                    product.price) /
                product.oldPrice!) *
            100)
        .round();

  }





  Widget _buildTitle() {


    return Text(


      product.name,


      maxLines:
          1,


      overflow:
          TextOverflow.ellipsis,


      style:
          AppTextStyles.titleMedium.copyWith(


        fontWeight:
            FontWeight.w700,


      ),
    );
  }





  Widget _buildSubtitle() {


    return Text(


      product.description,


      maxLines:
          2,


      overflow:
          TextOverflow.ellipsis,


      style:
          AppTextStyles.bodySmall,

    );
  }





  Widget _buildRating() {


    return Row(


      children: [



        Container(


          padding:
              const EdgeInsets.symmetric(

            horizontal:
                6,

            vertical:
                2,

          ),



          decoration:
              BoxDecoration(


            color:
                AppColors.success,


            borderRadius:
                BorderRadius.circular(
              AppSizes.radiusS,
            ),

          ),



          child:
              Row(


            children: [


              const Icon(

                Icons.star_rounded,

                size:
                    14,

                color:
                    AppColors.white,

              ),



              const SizedBox(
                width:
                    2,
              ),



              Text(


                product.rating.toStringAsFixed(1),



                style:
                    const TextStyle(


                  color:
                      AppColors.white,


                  fontSize:
                      11,


                  fontWeight:
                      FontWeight.bold,


                ),
              ),

            ],
          ),
        ),



        const SizedBox(

          width:
              AppSizes.spaceS,

        ),



        Expanded(


          child:
              Text(


            product.unit,


            maxLines:
                1,


            overflow:
                TextOverflow.ellipsis,


            style:
                AppTextStyles.caption,

          ),
        ),
      ],
    );
  }
    Widget _buildPrice() {


    return Row(


      crossAxisAlignment:
          CrossAxisAlignment.end,



      children: [



        Text(


          "${AppConstants.currencySymbol}${product.price.toStringAsFixed(0)}",



          style:
              AppTextStyles.price,


        ),




        if (_hasDiscount) ...[


          const SizedBox(

            width:
                AppSizes.spaceS,

          ),




          Text(


            "${AppConstants.currencySymbol}${product.oldPrice!.toStringAsFixed(0)}",



            style:
                AppTextStyles.oldPrice,


          ),


        ],





        const Spacer(),





        if (_hasDiscount)


          Text(


            "$discountPercentage% OFF",



            style:
                AppTextStyles.labelSmall.copyWith(


              color:
                  AppColors.offer,


              fontWeight:
                  FontWeight.bold,


            ),
          ),


      ],
    );
  }







  Widget _buildBottomButton(

    BuildContext context,

    CartProvider cart,

    int quantity,

  ) {



    if (!product.isAvailable) {


      return SizedBox(


        width:
            double.infinity,



        child:
            OutlinedButton(


          onPressed:
              null,



          child:
              const Text(

            "Unavailable",

          ),

        ),
      );
    }





    if (quantity == 0) {



      return SizedBox(


        width:
            double.infinity,



        height:
            AppSizes.buttonHeight - 10,



        child:
            ElevatedButton(


          onPressed: () {


            cart.addToCart(product);


          },



          style:
              ElevatedButton.styleFrom(


            backgroundColor:
                AppColors.primary,


            foregroundColor:
                AppColors.white,



            elevation:
                0,



            shape:
                RoundedRectangleBorder(


              borderRadius:
                  BorderRadius.circular(

                AppSizes.radiusM,

              ),

            ),

          ),



          child:
              const Text(


            "ADD",


            style:
                AppTextStyles.button,


          ),
        ),
      );
    }






    return _buildQuantitySelector(

      cart,

      quantity,

    );
  }








  Widget _buildQuantitySelector(


    CartProvider cart,

    int quantity,


  ) {



    return Container(


      height:
          AppSizes.buttonHeight - 10,



      decoration:
          BoxDecoration(


        color:
            AppColors.primary,



        borderRadius:
            BorderRadius.circular(

          AppSizes.radiusM,

        ),

      ),





      child:
          Row(


        children: [



          Expanded(


            child:
                IconButton(


              onPressed: () {


                cart.decreaseQuantity(
                  product.id,
                );


              },



              icon:
                  const Icon(


                Icons.remove,


                color:
                    AppColors.white,


              ),
            ),
          ),





          Text(


            quantity.toString(),



            style:
                AppTextStyles.button,


          ),





          Expanded(


            child:
                IconButton(


              onPressed: () {


                cart.increaseQuantity(
                  product.id,
                );


              },



              icon:
                  const Icon(


                Icons.add,


                color:
                    AppColors.white,


              ),
            ),
          ),


        ],
      ),
    );
  }

}