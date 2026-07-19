import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../models/faq_model.dart';
import '../models/support_category_model.dart';


class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

   IconData getIcon(String icon) {
    switch (icon) {
      case 'shopping_bag':
        return Icons.shopping_bag_outlined;

      case 'payments':
        return Icons.payment_outlined;

      case 'person':
        return Icons.person_outline;

      case 'delivery':
        return Icons.delivery_dining_outlined;

      case 'refund':
        return Icons.currency_rupee_outlined;

      case 'account':
        return Icons.manage_accounts_outlined;

      default:
        return Icons.help_outline;
    }
  }


  @override
  Widget build(BuildContext context) {
    final categories = [
  const SupportCategoryModel(
    id: '1',
    title: 'Orders',
    description: 'Help regarding your orders',
    icon: 'shopping_bag',
  ),
  const SupportCategoryModel(
    id: '2',
    title: 'Payments',
    description: 'Payment related issues',
    icon: 'payments',
  ),
  const SupportCategoryModel(
    id: '3',
    title: 'Account',
    description: 'Account & profile support',
    icon: 'person',
  ),
];

    final faqs = [
  const FaqModel(
    id: '1',
    question: 'How can I cancel an order?',
    answer:
        'Orders can be cancelled before preparation starts.',
  ),

  const FaqModel(
    id: '2',
    question: 'How do I contact support?',
    answer:
        'Email support@mamahomefood.com.',
  ),
];

    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.helpSupport,
        showBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        children: [
          Text(
            AppStrings.supportCategories,
            style: Theme.of(context)
                .textTheme
                .titleLarge,
          ),

          const SizedBox(height: AppSizes.spaceM),

          ...categories.map(
            (category) => Card(
              child: ListTile(
                leading: Icon(
  getIcon(category.icon),
),
                title: Text(category.title),
              ),
            ),
          ),

          const SizedBox(height: AppSizes.spaceXL),

          Text(
            AppStrings.faq,
            style: Theme.of(context)
                .textTheme
                .titleLarge,
          ),

          const SizedBox(height: AppSizes.spaceM),

          ...faqs.map(
            (faq) => ExpansionTile(
              title: Text(faq.question),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(faq.answer),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}