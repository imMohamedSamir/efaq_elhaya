import 'package:flutter/material.dart';

class HomeOptionModel {
  final String title;
  final IconData icon;
  final Widget route;
  final bool isActive;

  HomeOptionModel(
      {required this.title,
      required this.icon,
      required this.route,
      this.isActive = false});
}
