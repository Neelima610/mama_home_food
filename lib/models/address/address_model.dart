
// address_model.dart
class AddressModel {
  const AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.houseNo,
    required this.street,
    required this.area,
    required this.city,
    required this.state,
    required this.pincode,
    this.landmark,
    this.addressType = AddressType.home,
    this.isDefault = false,
  });

  final String id;
  final String name;
  final String phoneNumber;

  final String houseNo;
  final String street;
  final String area;
  final String city;
  final String state;
  final String pincode;

  final String? landmark;

  final AddressType addressType;
  final bool isDefault;


  String get fullAddress {
    return [
      houseNo,
      street,
      area,
      if (landmark != null && landmark!.isNotEmpty)
        landmark,
      city,
      state,
      pincode,
    ].join(', ');
  }


  AddressModel copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? houseNo,
    String? street,
    String? area,
    String? city,
    String? state,
    String? pincode,
    String? landmark,
    AddressType? addressType,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      houseNo: houseNo ?? this.houseNo,
      street: street ?? this.street,
      area: area ?? this.area,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      landmark: landmark ?? this.landmark,
      addressType: addressType ?? this.addressType,
      isDefault: isDefault ?? this.isDefault,
    );
  }


  // Convert AddressModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'houseNo': houseNo,
      'street': street,
      'area': area,
      'city': city,
      'state': state,
      'pincode': pincode,
      'landmark': landmark,
      'addressType': addressType.name,
      'isDefault': isDefault,
    };
  }


  // Create AddressModel from Map
  factory AddressModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return AddressModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      houseNo: map['houseNo'] ?? '',
      street: map['street'] ?? '',
      area: map['area'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      pincode: map['pincode'] ?? '',
      landmark: map['landmark'],

      addressType: AddressType.values.firstWhere(
        (type) =>
            type.name == map['addressType'],
        orElse: () => AddressType.home,
      ),

      isDefault: map['isDefault'] ?? false,
    );
  }
}


enum AddressType {
  home,
  work,
  other,
}