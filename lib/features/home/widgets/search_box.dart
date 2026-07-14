import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../shared/widgets/common/custom_text_field.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: AppStrings.searchHint,
      prefixIcon: Icons.search_rounded,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      textInputAction: TextInputAction.search,
    );
  }
}