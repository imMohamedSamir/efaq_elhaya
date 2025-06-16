import 'package:efaq_elhaya/Core/Utlis/service_locator.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/manager/home_cubit/home_cubit.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/family_view.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/home_body.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/home_navigation_bar.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/individuals_view.dart';
import 'package:efaq_elhaya/Features/Home_View/data/repo/home_repo_impl.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> pages = [
    const FamilyView(),
    const IndividualsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentPage = ValueNotifier<int>(0);

    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())..getMetaData(),
      child: Scaffold(
        body: HomeBody(currentPage: currentPage, pages: pages),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: currentPage,
          builder: (context, pageIndex, _) {
            return HomeNavigationBar(
              onItemTapped: (index) => currentPage.value = index,
              currentIndex: pageIndex,
            );
          },
        ),
      ),
    );
  }
}
