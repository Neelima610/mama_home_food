import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/address/address_model.dart';
import 'address_type_chip.dart';
import 'default_address_badge.dart';


class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.address,
    this.isSelected = false,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.onSetDefault,
  });


  final AddressModel address;

  final bool isSelected;

  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onSetDefault;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: AppSizes.spaceL,
      ),

      elevation: 0,

      color: AppColors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),

        side: BorderSide(
          color: isSelected
              ? AppColors.primary
              : AppColors.border,

          width: isSelected ? 2 : 1,
        ),
      ),


      child: InkWell(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),

        onTap: onTap,


        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.spaceL,
          ),


          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,


            children: [

              // Name + Type
              Row(
                children: [

                  Expanded(
                    child: Text(
                      address.name,

                      style:
                          AppTextStyles.titleLarge,
                    ),
                  ),


                  AddressTypeChip(
                    type: address.addressType,
                  ),
                ],
              ),


              const SizedBox(
                height: AppSizes.spaceS,
              ),



              // Phone
              Text(
                '${AppStrings.countryCode} ${address.phoneNumber}',

                style:
                    AppTextStyles.bodyMedium,
              ),



              const SizedBox(
                height: AppSizes.spaceS,
              ),



              // Address
              Text(
                address.fullAddress,

                style:
                    AppTextStyles.bodyMedium,
              ),



              if (address.isDefault) ...[

                const SizedBox(
                  height: AppSizes.spaceM,
                ),


                const DefaultAddressBadge(),
              ],



              const SizedBox(
                height: AppSizes.spaceL,
              ),



              // Actions
              Wrap(

                spacing:
                    AppSizes.spaceS,

                runSpacing:
                    AppSizes.spaceS,


                children: [


                  TextButton.icon(
                    onPressed: onEdit,

                    icon: const Icon(
                      Icons.edit_outlined,
                    ),

                    label: const Text(
                      AppStrings.editAddress,
                    ),
                  ),



                  TextButton.icon(
                    onPressed: onDelete,

                    icon: const Icon(
                      Icons.delete_outline,
                    ),

                    label: const Text(
                      AppStrings.delete,
                    ),
                  ),



                  if (!address.isDefault)

                    OutlinedButton(
                      onPressed:
                          onSetDefault,

                      child: const Text(
                        AppStrings.setDefault,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}