import 'package:efaq_elhaya/Core/Utlis/custom_dialog.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/manager/families_cubit/families_cubit.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/manager/families_cubit/families_state.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/families_Card_loading.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_forms_card.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_forms_list_header.dart';
import 'package:efaq_elhaya/Features/familyFormsView/data/models/family_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FamilyFormsList extends StatelessWidget {
  const FamilyFormsList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FamiliesCubit.get(context);
    return BlocBuilder<FamiliesCubit, FamiliesState>(
      builder: (context, state) {
        if (state.data != null && state.data!.isNotEmpty) {
          return Expanded(
            child: Column(
              children: [
                const FamilyFormsListHeader(),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: cubit.items,
                    builder: (BuildContext context, List<FamilyModel> value,
                        Widget? child) {
                      return ListView.builder(
                        controller: cubit.scrollController,
                        itemCount: value.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < value.length) {
                            return FamilyFormsCard(
                              isEven: index.isEven,
                              family: value[index],
                              confirmDismiss: (direction) async {
                                final shouldDelete =
                                    await CustomDialog.familyDeleteMsg(
                                        onDelete: () async {
                                  return true;
                                });
                                return shouldDelete ?? false;
                              },
                              onDismissed: (p0) {
                                cubit.deleteFamily(id: value[index].id!);
                              },
                            );
                          } else {
                            if (state.hasMore) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: ColorManager.primary));
                            }
                          }
                          return null;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state.isLoading) {
          return const FamiliesCardLoading();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
