// address_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../shared/widgets/feedback/app_snackbar.dart';
import '../providers/address_provider.dart';
import '../widgets/address_card.dart';
import '../widgets/address_empty_view.dart';
import '../widgets/address_loading.dart';


class AddressScreen extends StatelessWidget {
  const AddressScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          AppStrings.myAddresses,
        ),
      ),


      floatingActionButton:
          FloatingActionButton.extended(

        onPressed: () {

          Navigator.pushNamed(
            context,
            RouteNames.addAddress,
          );

        },


        icon: const Icon(
          Icons.add_location_alt_outlined,
        ),


        label: const Text(
          AppStrings.addAddress,
        ),
      ),



      body: Consumer<AddressProvider>(

        builder: (
          context,
          provider,
          child,
        ) {


          if (provider.isLoading) {

            return const Padding(
              padding: EdgeInsets.all(
                AppSizes.screenPadding,
              ),

              child: AddressLoading(),
            );
          }



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



              return AddressCard(

                address: address,



                onTap: () {

                  Navigator.pushNamed(
    context,
    RouteNames.editAddress,
    arguments: address,
  );

                },



                onEdit: () {

                  Navigator.pushNamed(
                    context,
                    RouteNames.editAddress,
                    arguments: address,
                  );

                },



                onDelete: () {


                  provider.deleteAddress(
                    address.id,
                  );


                  AppSnackbar.showSuccess(
                    context,
                    AppStrings.addressDeleted,
                  );

                },



                onSetDefault: () {


                  provider.setDefaultAddress(
                    address.id,
                  );


                  AppSnackbar.showSuccess(
                    context,
                    AppStrings.defaultAddressUpdated,
                  );

                },

              );
            },
          );
        },
      ),
    );
  }
}