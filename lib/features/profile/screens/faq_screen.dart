import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../providers/profile_provider.dart';

class FaqScreen extends StatefulWidget {
const FaqScreen({
super.key,
});

@override
State<FaqScreen> createState() =>
_FaqScreenState();
}

class _FaqScreenState
extends State<FaqScreen> {

//--------------------------------------------------
// State
//--------------------------------------------------

String _searchQuery = '';

//--------------------------------------------------
// Lifecycle
//--------------------------------------------------

@override
void initState() {
super.initState();

WidgetsBinding.instance
    .addPostFrameCallback((_) {
  context
      .read<ProfileProvider>()
      .loadFaqs();
});

}

//--------------------------------------------------
// Build
//--------------------------------------------------

@override
Widget build(
BuildContext context,
) {
return Scaffold(
//--------------------------------------------------
// App Bar
//--------------------------------------------------

  appBar: const CustomAppBar(
    title: AppStrings.faq,
    showBackButton: true,
  ),

  //--------------------------------------------------
  // Body
  //--------------------------------------------------

  body: Consumer<ProfileProvider>(
    builder: (
      context,
      provider,
      child,
    ) {
      //--------------------------------------------------
      // Loading
      //--------------------------------------------------

      if (provider.isLoading &&
          !provider.hasFaqs) {
        return const Center(
          child:
              CircularProgressIndicator(),
        );
      }

      //--------------------------------------------------
      // Error
      //--------------------------------------------------

      if (provider.hasError &&
          !provider.hasFaqs) {
        return _ErrorView(
          message:
              provider.errorMessage!,

          onRetry:
              provider.loadFaqs,
        );
      }

      final query =
          _searchQuery
              .toLowerCase()
              .trim();

      final filteredFaqs =
          provider.faqs.where(
        (faq) {
          if (query.isEmpty) {
            return true;
          }

          return faq.question
                  .toLowerCase()
                  .contains(query) ||
              faq.answer
                  .toLowerCase()
                  .contains(query);
        },
      ).toList();

      //--------------------------------------------------
      // Content
      //--------------------------------------------------

      return Column(
        children: [

          //--------------------------------------------------
          // Search
          //--------------------------------------------------

          Padding(
            padding:
                const EdgeInsets.all(
              AppSizes.screenPadding,
            ),

            child: _SearchField(
              onChanged: (value) {
                setState(() {
                  _searchQuery =
                      value;
                });
              },
            ),
          ),

          //--------------------------------------------------
          // Empty
          //--------------------------------------------------

          if (filteredFaqs.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  AppStrings.noDataFound,
                ),
              ),
            )

          //--------------------------------------------------
          // FAQ List
          //--------------------------------------------------

          else
            Expanded(
              child: RefreshIndicator(
                onRefresh:
                    provider.loadFaqs,

                child: ListView.builder(
                  padding:
                      const EdgeInsets
                          .symmetric(
                    horizontal:
                        AppSizes.screenPadding,
                  ),

                  itemCount:
                      filteredFaqs.length,

                  itemBuilder:
                      (
                    context,
                    index,
                  ) {
                    final faq =
                        filteredFaqs[index];

                    return Card(
                      margin:
                          const EdgeInsets
                              .only(
                        bottom:
                            AppSizes.spaceS,
                      ),

                      child:
                          ExpansionTile(
                        title: Text(
                          faq.question,
                        ),

                        children: [

                          Padding(
                            padding:
                                const EdgeInsets
                                    .fromLTRB(
                              AppSizes.spaceL,
                              0,
                              AppSizes.spaceL,
                              AppSizes.spaceL,
                            ),

                            child: Align(
                              alignment:
                                  Alignment
                                      .centerLeft,

                              child: Text(
                                faq.answer,

                                style: Theme
                                    .of(
                                  context,
                                )
                                    .textTheme
                                    .bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      );
    },
  ),
);

}
}

//--------------------------------------------------
// Search Field
//--------------------------------------------------

class _SearchField
extends StatelessWidget {
const _SearchField({
required this.onChanged,
});

final ValueChanged<String>
onChanged;

@override
Widget build(
BuildContext context,
) {
return TextField(
onChanged:
onChanged,

  decoration:
      InputDecoration(
    hintText:
        'Search FAQs',

    prefixIcon:
        const Icon(
      Icons.search,
    ),

    filled:
        true,

    border:
        OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(
        AppSizes.radiusM,
      ),

      borderSide:
          BorderSide.none,
    ),
  ),
);

}
}

//--------------------------------------------------
// Error View
//--------------------------------------------------

class _ErrorView
extends StatelessWidget {
const _ErrorView({
required this.message,
required this.onRetry,
});

final String message;

final Future<void> Function()
onRetry;

@override
Widget build(
BuildContext context,
) {
return Center(
child: Padding(
padding:
const EdgeInsets.all(
AppSizes.screenPadding,
),

    child: Column(
      mainAxisSize:
          MainAxisSize.min,

      children: [

        const Icon(
          Icons.error_outline,

          size:
              AppSizes.iconL,
        ),

        const SizedBox(
          height:
              AppSizes.spaceM,
        ),

        Text(
          message,

          textAlign:
              TextAlign.center,
        ),

        const SizedBox(
          height:
              AppSizes.spaceL,
        ),

        FilledButton(
          onPressed:
              onRetry,

          child: const Text(
            AppStrings.retry,
          ),
        ),
      ],
    ),
  ),
);

}
}
