import '../../../models/address/address_model.dart';


class AddressRepository {

  final List<AddressModel> _addresses = [];



  Future<List<AddressModel>> getAddresses() async {

    return List.unmodifiable(
      _addresses,
    );
  }



  Future<void> addAddress(
    AddressModel address,
  ) async {

    _addresses.add(
      address,
    );
  }



  Future<void> updateAddress(
    AddressModel address,
  ) async {

    final index =
        _addresses.indexWhere(
      (item) =>
          item.id == address.id,
    );


    if (index != -1) {

      _addresses[index] =
          address;
    }
  }



  Future<void> deleteAddress(
    String id,
  ) async {

    _addresses.removeWhere(
      (address) =>
          address.id == id,
    );
  }



  Future<void> clearAddresses() async {

    _addresses.clear();
  }
}