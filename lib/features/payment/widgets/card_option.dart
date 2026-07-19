import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import 'saved_cards.dart';

class CardOption extends StatelessWidget {
  const CardOption({
    super.key,
    required this.cardNumberController,
    required this.expiryController,
    required this.cvvController,
    required this.savedCards,
    required this.selectedCard,
    required this.onSavedCardSelected,
  });

  //--------------------------------------------------
  // Controllers
  //--------------------------------------------------

  final TextEditingController cardNumberController;

  final TextEditingController expiryController;

  final TextEditingController cvvController;

  //--------------------------------------------------
  // Saved Cards
  //--------------------------------------------------

  final List<SavedCardData> savedCards;

  final String? selectedCard;

  final ValueChanged<SavedCardData>
      onSavedCardSelected;

  //--------------------------------------------------
  // Build
  //--------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppNumbers.cardElevation,

      color: AppColors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceL,
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            //--------------------------------------------------
            // Title
            //--------------------------------------------------

            Text(
              AppStrings.card,

              style: AppTextStyles.titleLarge,
            ),

            //--------------------------------------------------
            // Saved Cards
            //--------------------------------------------------

            if (savedCards.isNotEmpty) ...[
              const SizedBox(
                height: AppSizes.spaceL,
              ),

              Text(
                'Saved Cards',

                style:
                    AppTextStyles.titleMedium,
              ),

              const SizedBox(
                height: AppSizes.spaceS,
              ),

              ...savedCards.map(
                (card) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(
                      bottom: AppSizes.spaceS,
                    ),

                    child: SavedCard(
                      cardNumber:
                          card.lastFourDigits,

                      cardHolderName:
                          card.cardHolderName,

                      expiryDate:
                          card.expiryDate,

                      isSelected:
                          selectedCard ==
                              card.id,

                      onTap: () {
                        onSavedCardSelected(
                          card,
                        );
                      },
                    ),
                  );
                },
              ),

              const SizedBox(
                height: AppSizes.spaceM,
              ),

              const Divider(),

              const SizedBox(
                height: AppSizes.spaceM,
              ),
            ],

            //--------------------------------------------------
            // Card Number
            //--------------------------------------------------

            TextField(
              key: const ValueKey(
                AppKeys.cardNumberField,
              ),

              controller:
                  cardNumberController,

              keyboardType:
                  TextInputType.number,

              decoration: InputDecoration(
                labelText:
                    AppStrings.cardNumber,

                hintText:
                    AppStrings.cardNumberHint,

                prefixIcon: const Icon(
                  Icons.credit_card,

                  color: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // Expiry Date and CVV
            //--------------------------------------------------

            Row(
              children: [

                //--------------------------------------------------
                // Expiry Date
                //--------------------------------------------------

                Expanded(
                  child: TextField(
                    key: const ValueKey(
                      AppKeys.expiryField,
                    ),

                    controller:
                        expiryController,

                    keyboardType:
                        TextInputType.number,

                    decoration:
                        const InputDecoration(
                      labelText:
                          AppStrings.expiryDate,

                      hintText:
                          AppStrings.expiryHint,
                    ),
                  ),
                ),

                const SizedBox(
                  width: AppSizes.spaceM,
                ),

                //--------------------------------------------------
                // CVV
                //--------------------------------------------------

                Expanded(
                  child: TextField(
                    key: const ValueKey(
                      AppKeys.cvvField,
                    ),

                    controller:
                        cvvController,

                    obscureText: true,

                    keyboardType:
                        TextInputType.number,

                    decoration:
                        const InputDecoration(
                      labelText:
                          AppStrings.cvv,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//--------------------------------------------------
// Saved Card Data
//--------------------------------------------------

class SavedCardData {
  const SavedCardData({
    required this.id,
    required this.lastFourDigits,
    this.cardHolderName,
    this.expiryDate,
  });

  //--------------------------------------------------
  // Properties
  //--------------------------------------------------

  final String id;

  final String lastFourDigits;

  final String? cardHolderName;

  final String? expiryDate;
}