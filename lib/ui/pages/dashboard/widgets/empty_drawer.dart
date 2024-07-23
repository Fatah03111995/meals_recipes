import 'package:flutter/material.dart';

class EmptyDrawer extends StatelessWidget {
  const EmptyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
      width: 0,
      color: Colors.transparent,
    );
  }
}
