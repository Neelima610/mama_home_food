
// orders_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';

import '../providers/order_provider.dart';

import '../widgets/orders_app_bar.dart';
import '../widgets/order_card.dart';
import '../widgets/order_empty_view.dart';
import '../widgets/order_loading.dart';

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

    WidgetsBinding.instance
        .addPostFrameCallback(
      (_) {
        context
            .read<OrderProvider>()
            .loadOrders();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<OrderProvider>();

    return Scaffold(
      appBar: const OrdersAppBar(),

      body: SafeArea(
        child: provider.isLoading
            ? const OrderLoading()
            : provider.isEmpty
                ? OrderEmptyView(
                    onStartShopping: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNames.home,
                        (route) => false,
                      );
                    },
                  )
                : RefreshIndicator(
                    onRefresh:
                        provider.loadOrders,
                    child: ListView.builder(
                      padding:
                          const EdgeInsets.all(
                        AppSizes.screenPadding,
                      ),
                      itemCount:
                          provider.orders.length,
                      itemBuilder:
                          (context, index) {
                        final order =
                            provider
                                .orders[index];

                        return Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom:
                                AppSizes.spaceM,
                          ),
                          child: OrderCard(
                            order: order,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames
                                    .orderDetails,
                                arguments:
                                    order,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}