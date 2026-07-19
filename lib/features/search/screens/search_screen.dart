import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

import '../providers/search_provider.dart';

import '../widgets/search_bar.dart';
import '../widgets/recent_search_card.dart';
import '../widgets/search_suggestion.dart';
import '../widgets/search_category_chip.dart';
import '../widgets/search_result_card.dart';
import '../widgets/search_empty_state.dart';
import '../widgets/search_no_result.dart';
import '../widgets/search_loading.dart';
import '../widgets/search_filter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() =>
      _SearchScreenState();
}

class _SearchScreenState
    extends State<SearchScreen> {
  //--------------------------------------------------
  // Controllers
  //--------------------------------------------------

  late final TextEditingController
      _searchController;

  late final FocusNode _focusNode;

  //--------------------------------------------------
  // Init
  //--------------------------------------------------

  @override
  void initState() {
    super.initState();

    _searchController =
        TextEditingController();

    _focusNode = FocusNode();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      if (!mounted) return;

      context
          .read<SearchProvider>()
          .initialize();
    });
  }

  //--------------------------------------------------
  // Dispose
  //--------------------------------------------------

  @override
  void dispose() {
    _searchController.dispose();

    _focusNode.dispose();

    super.dispose();
  }

  //--------------------------------------------------
  // Build
  //--------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.background,

      appBar: AppBar(
        backgroundColor:
            AppColors.background,

        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),

        title: Text(
          'Search',

          style:
              AppTextStyles.titleLarge.copyWith(
            fontWeight:
                FontWeight.w700,
          ),
        ),
      ),

      body: Column(
        children: [
          //--------------------------------------------------
          // Search Bar
          //--------------------------------------------------

          Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: AppSizes.spaceM,
            ),

            child: SearchBarWidget(
              controller:
                  _searchController,

              focusNode:
                  _focusNode,

              onChanged: (value) {
                context
                    .read<SearchProvider>()
                    .search(value);
              },

              onSubmitted: (value) {
                context
                    .read<SearchProvider>()
                    .submitSearch(value);

                _focusNode.unfocus();
              },

              onClear: () {
                _searchController.clear();

                context
                    .read<SearchProvider>()
                    .clearSearch();

                _focusNode.requestFocus();
              },
            ),
          ),

          const SizedBox(
            height: AppSizes.spaceM,
          ),

          //--------------------------------------------------
          // Content
          //--------------------------------------------------

          Expanded(
            child: Consumer<SearchProvider>(
              builder: (
                context,
                provider,
                child,
              ) {
                //--------------------------------------------------
                // Loading
                //--------------------------------------------------

                if (provider.isLoading) {
                  return const SearchLoading();
                }

                //--------------------------------------------------
                // Empty Search
                //--------------------------------------------------

                if (!provider.hasQuery) {
                  return _buildInitialContent(
                    provider,
                  );
                }

                //--------------------------------------------------
                // No Results
                //--------------------------------------------------

                if (!provider.hasResults) {
                  return SearchNoResult(
                    query:
                        provider.query,

                    onClear: () {
                      _clearSearch();
                    },
                  );
                }

                //--------------------------------------------------
                // Search Results
                //--------------------------------------------------

                return _buildSearchResults(
                  provider,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //--------------------------------------------------
  // Initial Content
  //--------------------------------------------------

  Widget _buildInitialContent(
    SearchProvider provider,
  ) {
    if (provider.history.isEmpty) {
      return const SearchEmptyState();
    }

    return ListView(
      padding:
          const EdgeInsets.symmetric(
        horizontal: AppSizes.spaceM,
      ),

      children: [
        //--------------------------------------------------
        // Recent Search Header
        //--------------------------------------------------

        Row(
          children: [
            Text(
              'Recent Searches',

              style:
                  AppTextStyles.titleMedium
                      .copyWith(
                fontWeight:
                    FontWeight.w700,
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {
                provider.clearHistory();
              },

              child: const Text(
                'Clear All',
              ),
            ),
          ],
        ),

        const SizedBox(
          height: AppSizes.spaceS,
        ),

        //--------------------------------------------------
        // Recent Searches
        //--------------------------------------------------

        ...provider.history.map(
          (history) {
            return RecentSearchCard(
              history: history,

              onTap: () {
                _searchController.text =
                    history.query;

                provider.search(
                  history.query,
                );

                _focusNode.unfocus();
              },

              onRemove: () {
                provider.removeHistory(
                  history.query,
                );
              },
            );
          },
        ),

        const SizedBox(
          height: AppSizes.spaceL,
        ),

        const SearchEmptyState(),
      ],
    );
  }

  //--------------------------------------------------
  // Search Results
  //--------------------------------------------------

  Widget _buildSearchResults(
    SearchProvider provider,
  ) {
    return ListView(
      padding:
          const EdgeInsets.symmetric(
        horizontal: AppSizes.spaceM,
      ),

      children: [
        //--------------------------------------------------
        // Suggestions
        //--------------------------------------------------

        if (provider.suggestions.isNotEmpty)
          _buildSuggestions(provider),

        //--------------------------------------------------
        // Categories
        //--------------------------------------------------

        if (provider.categories.isNotEmpty)
          _buildCategories(provider),

        //--------------------------------------------------
        // Results Header
        //--------------------------------------------------

        _buildResultsHeader(provider),

        const SizedBox(
          height: AppSizes.spaceM,
        ),

        //--------------------------------------------------
        // Products
        //--------------------------------------------------

        ...provider.products.map(
          (product) {
            return Padding(
              padding:
                  const EdgeInsets.only(
                bottom: AppSizes.spaceM,
              ),

              child: SearchResultCard(
                product: product,
              ),
            );
          },
        ),
      ],
    );
  }

  //--------------------------------------------------
  // Suggestions
  //--------------------------------------------------

  Widget _buildSuggestions(
    SearchProvider provider,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Text(
          'Suggestions',

          style:
              AppTextStyles.titleMedium
                  .copyWith(
            fontWeight:
                FontWeight.w700,
          ),
        ),

        const SizedBox(
          height: AppSizes.spaceS,
        ),

        ...provider.suggestions.map(
          (suggestion) {
            return SearchSuggestion(
              text: suggestion,

              onTap: () {
                _searchController.text =
                    suggestion;

                provider.submitSearch(
                  suggestion,
                );

                _focusNode.unfocus();
              },
            );
          },
        ),

        const SizedBox(
          height: AppSizes.spaceL,
        ),
      ],
    );
  }

  //--------------------------------------------------
  // Categories
  //--------------------------------------------------

  Widget _buildCategories(
    SearchProvider provider,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Text(
          'Categories',

          style:
              AppTextStyles.titleMedium
                  .copyWith(
            fontWeight:
                FontWeight.w700,
          ),
        ),

        const SizedBox(
          height: AppSizes.spaceS,
        ),

        SizedBox(
          height: 48,

          child: ListView.separated(
            scrollDirection:
                Axis.horizontal,

            itemCount:
                provider.categories.length,

            separatorBuilder: (
              context,
              index,
            ) {
              return const SizedBox(
                width: AppSizes.spaceS,
              );
            },

            itemBuilder: (
              context,
              index,
            ) {
              final category =
                  provider.categories[index];

              return SearchCategoryChip(
                category: category,

                onTap: () {
                  _searchController.text =
                      category.name;

                  provider.search(
                    category.name,
                  );
                },
              );
            },
          ),
        ),

        const SizedBox(
          height: AppSizes.spaceL,
        ),
      ],
    );
  }

  //--------------------------------------------------
  // Results Header
  //--------------------------------------------------

  Widget _buildResultsHeader(
    SearchProvider provider,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${provider.products.length} Products Found',

            style:
                AppTextStyles.titleMedium
                    .copyWith(
              fontWeight:
                  FontWeight.w700,
            ),
          ),
        ),

        //--------------------------------------------------
        // Filter Button
        //--------------------------------------------------

        IconButton(
          onPressed: () {
            _showFilterSheet(
              context,
              provider,
            );
          },

          icon: const Icon(
            Icons.tune_rounded,
          ),
        ),
      ],
    );
  }

  //--------------------------------------------------
  // Filter Bottom Sheet
  //--------------------------------------------------

  void _showFilterSheet(
    BuildContext context,
    SearchProvider provider,
  ) {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      backgroundColor:
          AppColors.background,

      shape:
          const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),

      builder: (_) {
        return SearchFilter(
          initialFilter:
              provider.filter,

          onApply: (filter) {
            provider.applyFilter(
              filter,
            );
          },
        );
      },
    );
  }

  //--------------------------------------------------
  // Clear Search
  //--------------------------------------------------

  void _clearSearch() {
    _searchController.clear();

    context
        .read<SearchProvider>()
        .clearSearch();

    _focusNode.requestFocus();
  }
}