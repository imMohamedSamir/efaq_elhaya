part of 'family_pdf_cubit.dart';

@immutable
sealed class FamilyPdfState {}

final class FamilyPdfInitial extends FamilyPdfState {}

final class FamilyPdfSuccess extends FamilyPdfState {
  final File pdf;

  FamilyPdfSuccess({required this.pdf});
}

final class FamilyPdfLoading extends FamilyPdfState {}

final class FamilyPdfFailure extends FamilyPdfState {}
