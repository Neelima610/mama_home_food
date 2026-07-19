import 'package:flutter/material.dart';

import '../../../models/search/search_filter_model.dart';


class SearchFilter extends StatefulWidget {
  final SearchFilterModel initialFilter;

  final ValueChanged<SearchFilterModel>
      onApply;

  const SearchFilter({
    super.key,
    required this.initialFilter,
    required this.onApply,
  });

  @override
  State<SearchFilter> createState() =>
      _SearchFilterState();
}

class _SearchFilterState
    extends State<SearchFilter> {
  late SearchFilterModel _filter;

  @override
  void initState() {
    super.initState();

    _filter = widget.initialFilter;
  }

  void _applyFilter() {
    widget.onApply(_filter);

    Navigator.pop(context);
  }

  void _clearFilter() {
    setState(() {
      _filter =
          SearchFilterModel.initial();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisSize:
              MainAxisSize.min,

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            //--------------------------------------------------
            // Header
            //--------------------------------------------------

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  'Filters',

                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        fontWeight:
                            FontWeight.bold,
                      ),
                ),

                TextButton(
                  onPressed: _clearFilter,

                  child: const Text(
                    'Clear All',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // Food Type
            //--------------------------------------------------

            Text(
              'Food Type',

              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                    fontWeight:
                        FontWeight.w600,
                  ),
            ),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8,

              children: [
                ChoiceChip(
                  label: const Text(
                    'All',
                  ),

                  selected:
                      _filter.isVeg == null,

                  onSelected: (_) {
                    setState(() {
                      _filter = _filter.copyWith(
                        isVeg: null,
                      );
                    });
                  },
                ),

                ChoiceChip(
                  label: const Text(
                    'Veg',
                  ),

                  selected:
                      _filter.isVeg == true,

                  onSelected: (_) {
                    setState(() {
                      _filter = _filter.copyWith(
                        isVeg: true,
                      );
                    });
                  },
                ),

                ChoiceChip(
                  label: const Text(
                    'Non-Veg',
                  ),

                  selected:
                      _filter.isVeg == false,

                  onSelected: (_) {
                    setState(() {
                      _filter = _filter.copyWith(
                        isVeg: false,
                      );
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // Product Options
            //--------------------------------------------------

            SwitchListTile(
              contentPadding:
                  EdgeInsets.zero,

              title: const Text(
                'Best Sellers',
              ),

              value: _filter.isBestSeller,

              onChanged: (value) {
                setState(() {
                  _filter = _filter.copyWith(
                    isBestSeller: value,
                  );
                });
              },
            ),

            SwitchListTile(
              contentPadding:
                  EdgeInsets.zero,

              title: const Text(
                'Recommended',
              ),

              value: _filter.isRecommended,

              onChanged: (value) {
                setState(() {
                  _filter = _filter.copyWith(
                    isRecommended: value,
                  );
                });
              },
            ),

            SwitchListTile(
              contentPadding:
                  EdgeInsets.zero,

              title: const Text(
                'Offers Only',
              ),

              value: _filter.hasDiscount,

              onChanged: (value) {
                setState(() {
                  _filter = _filter.copyWith(
                    hasDiscount: value,
                  );
                });
              },
            ),

            const SizedBox(height: 12),

            //--------------------------------------------------
            // Apply
            //--------------------------------------------------

            SizedBox(
              width: double.infinity,

              child: FilledButton(
                onPressed: _applyFilter,

                child: const Text(
                  'Apply Filters',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}