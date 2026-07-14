class PhoneValidator {
  PhoneValidator._();

  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mobile number is required';
    }

    final mobile = value.trim();

    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(mobile)) {
      return 'Enter a valid mobile number';
    }

    return null;
  }
}