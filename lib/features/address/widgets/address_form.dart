import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/inputs/custom_text_field.dart';

import '../../../models/address/address_model.dart';
import 'address_type_chip.dart';


class AddressForm extends StatelessWidget {
  const AddressForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.houseController,
    required this.streetController,
    required this.areaController,
    required this.cityController,
    required this.stateController,
    required this.pincodeController,
    required this.landmarkController,
    required this.selectedType,
    required this.onTypeChanged,
  });


  final TextEditingController nameController;
  final TextEditingController phoneController;

  final TextEditingController houseController;
  final TextEditingController streetController;
  final TextEditingController areaController;

  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController pincodeController;

  final TextEditingController landmarkController;


  final AddressType selectedType;

  final ValueChanged<AddressType> onTypeChanged;



  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [


        Text(
          AppStrings.addressType,

          style:
              AppTextStyles.titleMedium,
        ),


        const SizedBox(
          height: AppSizes.spaceM,
        ),



        Wrap(
          spacing: AppSizes.spaceS,

          children: AddressType.values
              .map(
                (type) => AddressTypeChip(
                  type: type,

                  isSelected:
                      selectedType == type,

                  onTap: () =>
                      onTypeChanged(type),
                ),
              )
              .toList(),
        ),



        const SizedBox(
          height: AppSizes.spaceL,
        ),



        CustomTextField(
          controller: nameController,

          labelText:
              AppStrings.name,
        ),



        const SizedBox(
          height: AppSizes.spaceM,
        ),



        CustomTextField(
          controller: phoneController,

          labelText:
              AppStrings.mobileNumber,

          keyboardType:
              TextInputType.phone,
        ),



        const SizedBox(
          height: AppSizes.spaceM,
        ),



        CustomTextField(
          controller: houseController,

          labelText:
              AppStrings.houseNo,
        ),



        const SizedBox(
          height: AppSizes.spaceM,
        ),



        CustomTextField(
          controller: streetController,

          labelText:
              AppStrings.street,
        ),



        const SizedBox(
          height: AppSizes.spaceM,
        ),



        CustomTextField(
          controller: areaController,

          labelText:
              AppStrings.area,
        ),



        const SizedBox(
          height: AppSizes.spaceM,
        ),



        CustomTextField(
          controller: cityController,

          labelText:
              AppStrings.city,
        ),



        const SizedBox(
          height: AppSizes.spaceM,
        ),



        CustomTextField(
          controller: stateController,

          labelText:
              AppStrings.state,
        ),



        const SizedBox(
          height: AppSizes.spaceM,
        ),



        CustomTextField(
          controller: pincodeController,

          labelText:
              AppStrings.pincode,

          keyboardType:
              TextInputType.number,
        ),



        const SizedBox(
          height: AppSizes.spaceM,
        ),



        CustomTextField(
          controller: landmarkController,

          labelText:
              AppStrings.landmark,

          maxLines: 2,
        ),
      ],
    );
  }
}