import 'package:flutter/widgets.dart';

class DashboardEntity {
  final String title;
  final String path;
  final IconData icon;
  final Widget page;
  const DashboardEntity({
    required this.title,
    required this.path,
    required this.icon,
    required this.page,
  });
}
