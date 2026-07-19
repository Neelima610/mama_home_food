import 'package:flutter/material.dart';

import '../../../models/address/address_model.dart';


class AddressProvider extends ChangeNotifier {

  final List<AddressModel> _addresses = [];


  AddressModel? _selectedAddress;


  bool _isLoading = false;



  // All addresses
  List<AddressModel> get addresses =>
      List.unmodifiable(_addresses);



  // Selected checkout address
  AddressModel? get selectedAddress =>
      _selectedAddress;



  // Loading state
  bool get isLoading =>
      _isLoading;



  // Default address
  AddressModel? get defaultAddress {

    try {

      return _addresses.firstWhere(
        (address) =>
            address.isDefault,
      );

    } catch (_) {

      return null;

    }
  }



  // Change loading state
  void setLoading(
    bool value,
  ) {

    _isLoading = value;

    notifyListeners();
  }



  // Add address
  void addAddress(
    AddressModel address,
  ) {

    _addresses.add(address);



    // First address automatically becomes default
    if (_addresses.length == 1) {

      _addresses[0] =
          _addresses[0].copyWith(
        isDefault: true,
      );


      _selectedAddress =
          _addresses[0];
    }


    notifyListeners();
  }



  // Update address
  void updateAddress(
    AddressModel updatedAddress,
  ) {

    final index =
        _addresses.indexWhere(
      (address) =>
          address.id ==
          updatedAddress.id,
    );


    if (index != -1) {

      _addresses[index] =
          updatedAddress;


      if (_selectedAddress?.id ==
          updatedAddress.id) {

        _selectedAddress =
            updatedAddress;
      }
    }


    notifyListeners();
  }



  // Delete address
  void deleteAddress(
    String id,
  ) {


    final wasDefault =
        _addresses.any(
      (address) =>
          address.id == id &&
          address.isDefault,
    );



    _addresses.removeWhere(
      (address) =>
          address.id == id,
    );



    if (_selectedAddress?.id == id) {

      _selectedAddress = null;
    }



    // Make another address default
    if (wasDefault &&
        _addresses.isNotEmpty) {

      _addresses[0] =
          _addresses[0].copyWith(
        isDefault: true,
      );
    }



    notifyListeners();
  }



  // Select address (Checkout)
  void selectAddress(
    AddressModel address,
  ) {

    _selectedAddress =
        address;

    notifyListeners();
  }



  // Set default address
  void setDefaultAddress(
    String id,
  ) {


    for (int i = 0;
        i < _addresses.length;
        i++) {


      _addresses[i] =
          _addresses[i].copyWith(
        isDefault:
            _addresses[i].id == id,
      );

    }



    _selectedAddress =
        _addresses.firstWhere(
      (address) =>
          address.id == id,

      orElse: () =>
          _addresses.first,
    );



    notifyListeners();
  }



  // Clear all addresses
  void clearAddresses() {

    _addresses.clear();

    _selectedAddress = null;

    notifyListeners();
  }
}