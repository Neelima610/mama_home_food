import 'package:mama_home_food/core/constants/app_strings.dart';

class AddressValidator {


  static String? validateName(
    String? value,
  ) {

    if (value == null ||
        value.trim().isEmpty) {

      return AppStrings.nameRequired;
    }


    return null;
  }




  static String? validatePhone(
    String? value,
  ) {

    if (value == null ||
        value.trim().isEmpty) {

      return AppStrings.phoneRequired;
    }


    if (value.length != 10) {

      return AppStrings.invalidPhone;
    }


    return null;
  }





  static String? validateRequired(
    String? value,
    String field,
  ) {

    if (value == null ||
        value.trim().isEmpty) {

      return '$field is required';
    }


    return null;
  }





  static String? validatePincode(
    String? value,
  ) {

    if (value == null ||
        value.trim().isEmpty) {

      return AppStrings.pincodeRequired;
    }


    if (value.length != 6) {

      return AppStrings.invalidPincode;
    }


    return null;
  }
}