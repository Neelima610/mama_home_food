import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../data/repositories/repositories.dart';
import '../../../models/payment/payment_method_type.dart';
import '../helpers/payment_helper.dart';
import '../helpers/payment_validator.dart';
import '../providers/payment_provider.dart';
import '../widgets/card_option.dart';
import '../widgets/cod_option.dart';
import '../widgets/payment_bottom_bar.dart';
import '../widgets/payment_method_list.dart';
import '../widgets/payment_summary_card.dart';
import '../widgets/upi_option.dart';
import '../widgets/wallet_option.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.total,
  });

  //--------------------------------------------------
  // Properties
  //--------------------------------------------------

  final double total;

  @override
  State<PaymentScreen> createState() =>
      _PaymentScreenState();
}

class _PaymentScreenState
    extends State<PaymentScreen> {

  //--------------------------------------------------
  // Payment Method
  //--------------------------------------------------

  int selectedIndex = 0;

  //--------------------------------------------------
  // Wallet
  //--------------------------------------------------

  String selectedWallet =
      AppStrings.phonePe;

  //--------------------------------------------------
  // Card
  //--------------------------------------------------

  final TextEditingController
      cardController =
      TextEditingController();

  final TextEditingController
      expiryController =
      TextEditingController();

  final TextEditingController
      cvvController =
      TextEditingController();

  String? selectedSavedCard;

  //--------------------------------------------------
  // UPI
  //--------------------------------------------------

  final TextEditingController
      upiController =
      TextEditingController();

  //--------------------------------------------------
  // Saved Cards
  //--------------------------------------------------

  final List<SavedCardData>
      savedCards = const [

    SavedCardData(
      id: 'card_1',
      lastFourDigits: '4242',
      cardHolderName: 'Neelima Sanati',
      expiryDate: '12/28',
    ),

    SavedCardData(
      id: 'card_2',
      lastFourDigits: '1234',
      cardHolderName: 'Neelima Sanati',
      expiryDate: '06/29',
    ),
  ];

  //--------------------------------------------------
  // Dispose
  //--------------------------------------------------

  @override
  void dispose() {
    cardController.dispose();

    expiryController.dispose();

    cvvController.dispose();

    upiController.dispose();

    super.dispose();
  }

  //--------------------------------------------------
  // Payment
  //--------------------------------------------------

  Future<void> _pay() async {
    final provider =
        context.read<PaymentProvider>();

    final method =
        PaymentHelper
            .paymentMethods[
                selectedIndex]
            .type;

    //--------------------------------------------------
    // Validation
    //--------------------------------------------------

    if (!PaymentValidator.canProceed(
      method: method,

      cardNumber:
          cardController.text,

      expiryDate:
          expiryController.text,

      cvv:
          cvvController.text,

      upiId:
          upiController.text,

      wallet:
          selectedWallet,
    )) {
      return;
    }

    //--------------------------------------------------
    // Start Loading
    //--------------------------------------------------

    provider.setLoading(true);

    //--------------------------------------------------
    // Make Payment
    //--------------------------------------------------

    final result =
        await PaymentRepository
            .makePayment(
      amount: widget.total,

      method: method,
    );

    //--------------------------------------------------
    // Stop Loading
    //--------------------------------------------------

    provider.setLoading(false);

    if (!mounted) {
      return;
    }

    //--------------------------------------------------
    // Payment Success
    //--------------------------------------------------

    if (result.isSuccess) {
      provider.setPaymentSuccess(
        result.transactionId,
      );

      Navigator.pushReplacementNamed(
        context,

        RouteNames.paymentSuccess,

        arguments:
            result.transactionId,
      );
    }

    //--------------------------------------------------
    // Payment Failed
    //--------------------------------------------------

    else {
      provider.setPaymentFailed();

      Navigator.pushReplacementNamed(
        context,

        RouteNames.paymentFailed,
      );
    }
  }

  //--------------------------------------------------
  // Payment Widget
  //--------------------------------------------------

  Widget _paymentWidget() {
    final method =
        PaymentHelper
            .paymentMethods[
                selectedIndex]
            .type;

    switch (method) {

      //--------------------------------------------------
      // Card
      //--------------------------------------------------

      case PaymentMethodType.card:
        return CardOption(
          cardNumberController:
              cardController,

          expiryController:
              expiryController,

          cvvController:
              cvvController,

          savedCards:
              savedCards,

          selectedCard:
              selectedSavedCard,

          onSavedCardSelected:
              _selectSavedCard,
        );

      //--------------------------------------------------
      // UPI
      //--------------------------------------------------

      case PaymentMethodType.upi:
        return UpiOption(
          controller:
              upiController,
        );

      //--------------------------------------------------
      // Wallet
      //--------------------------------------------------

      case PaymentMethodType.wallet:
        return WalletOption(
          selectedWallet:
              selectedWallet,

          onChanged: (wallet) {
            setState(() {
              selectedWallet =
                  wallet;
            });
          },
        );

      //--------------------------------------------------
      // Cash on Delivery
      //--------------------------------------------------

      case PaymentMethodType
          .cashOnDelivery:
        return const CodOption();
    }
  }

  //--------------------------------------------------
  // Select Saved Card
  //--------------------------------------------------

  void _selectSavedCard(
    SavedCardData card,
  ) {
    setState(() {
      selectedSavedCard =
          card.id;

      cardController.text =
          card.lastFourDigits;

      expiryController.text =
          card.expiryDate ?? '';

      cvvController.clear();
    });
  }

  //--------------------------------------------------
  // Build
  //--------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
      builder: (
        context,
        provider,
        child,
      ) {
        return Scaffold(

          //--------------------------------------------------
          // App Bar
          //--------------------------------------------------

          appBar: AppBar(
            title: const Text(
              AppStrings.payment,
            ),
          ),

          //--------------------------------------------------
          // Bottom Payment Button
          //--------------------------------------------------

          bottomNavigationBar:
              PaymentBottomBar(
            total:
                widget.total,

            isLoading:
                provider.isLoading,

            onPressed:
                _pay,
          ),

          //--------------------------------------------------
          // Body
          //--------------------------------------------------

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(
              AppSizes.screenPadding,
            ),

            child: Column(
              children: [

                //--------------------------------------------------
                // Payment Summary
                //--------------------------------------------------

                PaymentSummaryCard(
                  subtotal:
                      widget.total,

                  deliveryCharge:
                      0,

                  discount:
                      0,

                  total:
                      widget.total,
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceXL,
                ),

                //--------------------------------------------------
                // Payment Methods
                //--------------------------------------------------

                PaymentMethodList(
                  methods:
                      PaymentHelper
                          .paymentMethods,

                  selectedIndex:
                      selectedIndex,

                  onChanged: (index) {
                    setState(() {
                      selectedIndex =
                          index;
                    });

                    provider.selectMethod(
                      PaymentHelper
                          .paymentMethods[
                              index]
                          .type,
                    );
                  },
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceXL,
                ),

                //--------------------------------------------------
                // Selected Payment Method
                //--------------------------------------------------

                _paymentWidget(),

                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}