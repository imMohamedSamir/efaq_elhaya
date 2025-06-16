import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/manager/family_pdf_cubit/family_pdf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FamilyPdfBody extends StatelessWidget {
  const FamilyPdfBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyPdfCubit, FamilyPdfState>(
      builder: (context, state) {
        if (state is FamilyPdfSuccess) {
          return SfPdfViewer.file(state.pdf,
              pageLayoutMode: PdfPageLayoutMode.single,
              canShowScrollHead: false);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
