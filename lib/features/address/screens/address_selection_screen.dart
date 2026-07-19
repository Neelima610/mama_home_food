import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../providers/address_provider.dart';
import '../widgets/address_empty_view.dart';
import '../widgets/address_radio_tile.dart';


class AddressSelectionScreen extends StatelessWidget {
  const AddressSelectionScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          AppStrings.selectDeliveryAddress,
        ),
      ),



      body: Consumer<AddressProvider>(

        builder: (
          context,
          provider,
          child,
        ) {


          if (provider.addresses.isEmpty) {

            return AddressEmptyView(

              onAddAddress: () {

                Navigator.pushNamed(
                  context,
                  RouteNames.addAddress,
                );

              },

            );
          }



          return ListView.builder(

            padding: const EdgeInsets.all(
              AppSizes.screenPadding,
            ),


            itemCount:
                provider.addresses.length,



            itemBuilder: (
              context,
              index,
            ) {


              final address =
                  provider.addresses[index];



              return AddressRadioTile(

                address: address,


                isSelected:
                    provider.selectedAddress?.id ==
                        address.id,


                onTap: () {

                  provider.selectAddress(
                    address,
                  );

                },
              );
            },
          );
        },
      ),



      bottomNavigationBar:
          Consumer<AddressProvider>(

        builder: (
          context,
          provider,
          child,
        ) {


          return Padding(

            padding: const EdgeInsets.all(
              AppSizes.spaceL,
            ),


            child: ElevatedButton(

              onPressed:
                  provider.selectedAddress == null
                      ? null
                      : () {

                          Navigator.pop(
                            context,
                            provider.selectedAddress,
                          );

                        },


              child: const Text(
                AppStrings.useThisAddress,
              ),
            ),
          );
        },
      ),
    );
  }
}