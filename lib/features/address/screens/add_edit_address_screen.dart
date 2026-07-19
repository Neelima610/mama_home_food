import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/constants.dart';
import '../../../models/address/address_model.dart';
import '../../../shared/widgets/feedback/app_snackbar.dart';
import '../providers/address_provider.dart';
import '../widgets/address_form.dart';


class AddEditAddressScreen extends StatefulWidget {
  const AddEditAddressScreen({
    super.key,
    this.address,
  });

  final AddressModel? address;


  @override
  State<AddEditAddressScreen> createState() =>
      _AddEditAddressScreenState();
}



class _AddEditAddressScreenState
    extends State<AddEditAddressScreen> {


  final _formKey = GlobalKey<FormState>();


  late TextEditingController nameController;
  late TextEditingController phoneController;

  late TextEditingController houseController;
  late TextEditingController streetController;
  late TextEditingController areaController;

  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController pincodeController;

  late TextEditingController landmarkController;


  AddressType selectedType =
      AddressType.home;



  @override
  void initState() {
    super.initState();


    final address = widget.address;


    nameController =
        TextEditingController(
      text: address?.name ?? '',
    );


    phoneController =
        TextEditingController(
      text: address?.phoneNumber ?? '',
    );


    houseController =
        TextEditingController(
      text: address?.houseNo ?? '',
    );


    streetController =
        TextEditingController(
      text: address?.street ?? '',
    );


    areaController =
        TextEditingController(
      text: address?.area ?? '',
    );


    cityController =
        TextEditingController(
      text: address?.city ?? '',
    );


    stateController =
        TextEditingController(
      text: address?.state ?? '',
    );


    pincodeController =
        TextEditingController(
      text: address?.pincode ?? '',
    );


    landmarkController =
        TextEditingController(
      text: address?.landmark ?? '',
    );


    selectedType =
        address?.addressType ??
            AddressType.home;
  }



  @override
  void dispose() {

    nameController.dispose();
    phoneController.dispose();

    houseController.dispose();
    streetController.dispose();
    areaController.dispose();

    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();

    landmarkController.dispose();

    super.dispose();
  }




  void saveAddress() {


    if (!_formKey.currentState!.validate()) {
      return;
    }


    final provider =
        context.read<AddressProvider>();


    final newAddress =
        AddressModel(

      id: widget.address?.id ??
          const Uuid().v4(),

      name:
          nameController.text.trim(),

      phoneNumber:
          phoneController.text.trim(),

      houseNo:
          houseController.text.trim(),

      street:
          streetController.text.trim(),

      area:
          areaController.text.trim(),

      city:
          cityController.text.trim(),

      state:
          stateController.text.trim(),

      pincode:
          pincodeController.text.trim(),

      landmark:
          landmarkController.text.trim().isEmpty
              ? null
              : landmarkController.text.trim(),

      addressType:
          selectedType,

      isDefault:
          widget.address?.isDefault ?? false,
    );



    if (widget.address == null) {

      provider.addAddress(
        newAddress,
      );


      AppSnackbar.showSuccess(
        context,
        AppStrings.addressSaved,
      );


    } else {

      provider.updateAddress(
        newAddress,
      );


      AppSnackbar.showSuccess(
        context,
        AppStrings.addressUpdated,
      );
    }


    Navigator.pop(context);
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          widget.address == null
              ? AppStrings.addAddress
              : AppStrings.editAddress,
        ),
      ),



      body: SingleChildScrollView(

        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),


        child: Form(

          key: _formKey,


          child: AddressForm(

            nameController:
                nameController,

            phoneController:
                phoneController,

            houseController:
                houseController,

            streetController:
                streetController,

            areaController:
                areaController,

            cityController:
                cityController,

            stateController:
                stateController,

            pincodeController:
                pincodeController,

            landmarkController:
                landmarkController,

            selectedType:
                selectedType,


            onTypeChanged: (type) {

              setState(() {
                selectedType = type;
              });

            },
          ),
        ),
      ),


      bottomNavigationBar: Padding(

        padding: const EdgeInsets.all(
          AppSizes.spaceL,
        ),


        child: ElevatedButton(

          onPressed:
              saveAddress,


          child: Text(
            widget.address == null
                ? AppStrings.saveAddress
                : AppStrings.updateAddress
          ),
        ),
      ),
    );
  }
}