import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

class CustomSearchField<T> extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.onChanged,
    this.hint,
    this.onFilter,
    this.items,
  });
  final void Function(String)? onChanged;
  final void Function()? onFilter;
  final String? hint;
  final List<Widget>? items;
  @override
  Widget build(BuildContext context) {
    final Debouncer _debouncer = Debouncer();
    return SearchAnchor.bar(
      barHintText: hint,
      barHintStyle: WidgetStateProperty.all(AppTextStyles.medium16),
      barBackgroundColor: WidgetStateProperty.all(Colors.white),
      viewBackgroundColor: Colors.white,
      barTrailing: [
        IconButton(
            onPressed: onFilter, icon: const Icon(Icons.filter_list_rounded))
      ],
      viewTrailing: [
        IconButton(
            onPressed: onFilter, icon: const Icon(Icons.filter_list_rounded))
      ],
      suggestionsBuilder: (context, controller) {
        return [...List.generate(items?.length ?? 0, (index) => items![index])];
      },
      onChanged: (value) {
        const duration = Duration(milliseconds: 500);
        _debouncer.debounce(
          duration: duration,
          onDebounce: () {
            if (onChanged != null && value.isNotEmpty && value != "") {
              onChanged!(value);
            }
          },
        );
      },
    );
  }
}
