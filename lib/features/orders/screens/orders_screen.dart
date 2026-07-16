import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';

import '../../../core/routes/route_names.dart';
import '../providers/orders_provider.dart';
import '../widgets/order_app_bar.dart';
import '../widgets/order_card.dart';
import '../widgets/order_empty_view.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({
    super.key,
  });

  @override
  State<OrdersScreen> createState() =>
      _OrdersScreenState();
}

class _OrdersScreenState
    extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context
            .read<OrdersProvider>()
            .loadOrders();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<OrdersProvider>();

    return Scaffold(
      appBar: const OrderAppBar(),

      body: SafeArea(
        child: provider.isLoading
            ? OrderEmptyView(
  onStartShopping: () {
    Navigator.pop(context);

    // Or navigate to Home if preferred:
    // Navigator.pushNamedAndRemoveUntil(
    //   context,
    //   RouteNames.home,
    //   (route) => false,
    // );
  },
)
            : provider.isEmpty
                ? const Center(
                    child: Text(
                      AppStrings.noOrdersFound,
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.all(
                      AppSizes.screenPadding,
                    ),
                    itemCount:
                        provider.orders.length,
                    itemBuilder:
                        (context, index) {
                      final order =
                          provider.orders[index];

                      return OrderCard(
                        order: order,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.orderDetails,
                            arguments: order,
                          );
                        },
                      );
                    },
                  ),
      ),
    );
  }
}