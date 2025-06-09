import 'package:efaq_elhaya/Core/Extentions/filter_extentions.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/custom_radio_tile.dart';
import 'package:flutter/material.dart';

class FamilySearchFilters extends StatelessWidget {
  const FamilySearchFilters(
      {super.key, this.onChanged, required this.selectedFilter});
  final void Function(SearchFilterType)? onChanged;

  final ValueNotifier<SearchFilterType> selectedFilter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("تصنيفات البحث",
              style: AppTextStyles.semiBold18.copyWith(fontSize: 19)),
          ValueListenableBuilder<SearchFilterType>(
            valueListenable: selectedFilter,
            builder: (context, value, _) {
              return Column(
                children: SearchFilterType.values.map((filter) {
                  return CustomRadioTile(
                    title: filter.label,
                    value: filter,
                    groupValue: value,
                    onChanged: (_) {
                      selectedFilter.value = filter;
                      if (onChanged != null) onChanged!(filter);
                    },
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
