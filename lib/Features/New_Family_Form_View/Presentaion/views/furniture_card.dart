import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class FurnitureCard extends StatelessWidget {
  const FurnitureCard(
      {super.key, required this.title, required this.onChanged});
  final String title;
  final ValueChanged<int> onChanged;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isExist = ValueNotifier<bool>(false);
    final TextEditingController _controller = TextEditingController();
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: isExist,
          builder: (BuildContext context, bool value, Widget? child) {
            return Expanded(
                child: CustomTextField(
              controller: _controller,
              enabled: value,
              label: title,
              hintText: "ادخل العدد",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onChanged: (p0) {
                final int count = int.tryParse(p0) ?? 0;
                onChanged(count);
              },
            ));
          },
        ),
        CustomCheckBox(onChanged: (check) {
          isExist.value = check ?? false;
          if (!isExist.value) {
            _controller.clear();
            onChanged(0);
          }
        }),
      ],
    );
  }
}
