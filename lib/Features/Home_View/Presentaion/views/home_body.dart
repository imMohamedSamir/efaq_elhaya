import 'package:efaq_elhaya/Features/Home_View/Presentaion/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.currentPage,
    required this.pages,
  });

  final ValueNotifier<int> currentPage;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ModalProgressHUD(
          blur: 1.3,
          progressIndicator:
              const CircularProgressIndicator(color: Colors.white),
          inAsyncCall: state is HomeLoading,
          child: ValueListenableBuilder<int>(
            valueListenable: currentPage,
            builder: (context, pageIndex, _) {
              return pages[pageIndex];
            },
          ),
        );
      },
    );
  }
}
