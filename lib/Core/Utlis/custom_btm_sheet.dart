import 'package:efaq_elhaya/Core/Extentions/filter_extentions.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_search_filters.dart';
import 'package:flutter/material.dart';

abstract class CustomBtmSheet {
  static familiesSearch(BuildContext context,
      {void Function(SearchFilterType)? onChanged,
      required ValueNotifier<SearchFilterType> selectedFilter}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FamilySearchFilters(
          onChanged: onChanged,
          selectedFilter: selectedFilter,
        );
      },
    );
  }
}
