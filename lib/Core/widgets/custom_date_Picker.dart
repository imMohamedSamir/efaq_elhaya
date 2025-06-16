import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    this.hint,
    this.label,
    this.onSubmit,
    this.initailValue,
    this.isReqiured = false,
  });
  final String? hint;
  final String? label;
  final Function(String)? onSubmit;
  final String? initailValue;
  final bool isReqiured;
  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  String _selectedDate = "";

  @override
  void initState() {
    _checkInitialValue();
    super.initState();
  }

  void _formatDate({required DateTime date}) {
    _selectedDate = "${date.year}-${date.month}-${date.day}";
  }

  void _checkInitialValue() {
    if (widget.initailValue != null) {
      _formatDate(
          date: DateTime.tryParse(widget.initailValue!) ?? DateTime.now());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: widget.isReqiured ? Validation.general : null,
      controller: TextEditingController(text: _selectedDate),
      hintText: widget.hint,
      label: widget.label,
      readOnly: true,
      onTap: () => _showDiolog(context),
      suffixIcon: const Icon(Icons.date_range_rounded),
    );
  }

  void _showDiolog(BuildContext context,
      {DateRangePickerController? controller}) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 120.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SfDateRangePicker(
              todayHighlightColor: ColorManager.primary,
              toggleDaySelection: true,
              selectionTextStyle: AppTextStyles.medium18,
              rangeTextStyle: AppTextStyles.medium18,
              navigationMode: DateRangePickerNavigationMode.snap,

              headerStyle: DateRangePickerHeaderStyle(
                textStyle: AppTextStyles.medium18,
              ),
              view: DateRangePickerView.month,

              controller: controller,
              showActionButtons: true,
              onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
              selectionMode: DateRangePickerSelectionMode.single,
              cancelText: "الغاء",
              confirmText: "تم",
              onSubmit: (value) {
                if (value is DateTime) {
                  widget.onSubmit!(DateFormat('yyyy-MM-dd').format(value));
                  setState(() {
                    _formatDate(date: value);
                  });
                  Navigator.pop(context);
                }
              },
              onCancel: () {
                Navigator.pop(context);
              },
              selectionColor: ColorManager.primary,
              selectionShape: DateRangePickerSelectionShape.circle,
              // cellBuilder: (BuildContext context,
              //     DateRangePickerCellDetails cellDetails) {
              //   return Container(
              //     decoration: const BoxDecoration(shape: BoxShape.circle),
              //     alignment: Alignment.center,
              //     child: Text(
              //       cellDetails.date.day.toString(),
              //       style: AppTextStyles.medium16
              //           .copyWith(color: ColorManager.secondary),
              //     ),
              //   );
              // },
            ),
          ),
        );
      },
    );
  }
}
