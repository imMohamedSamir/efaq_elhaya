import 'package:efaq_elhaya/Core/Network/TokenManger.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/family_view.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/home_navigation_bar.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/views/individuals_view.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/profile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void checkToken() async {
    await TokenManager.removeToken();
  }

  static List<Widget> pages = [
    const FamilyView(),
    const IndividualsView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: HomeNavigationBar(
        onItemTapped: onItemTapped,
        currentIndex: currentPage,
      ),
    );
  }
}
