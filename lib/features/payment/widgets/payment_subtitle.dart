import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';

class PaymentSubtitle extends StatelessWidget {
  const PaymentSubtitle({
    super.key,
    required this.subtitle,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.bodySmall,
    );
  }
}