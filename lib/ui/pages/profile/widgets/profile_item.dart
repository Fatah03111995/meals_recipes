// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meals_recipes/core/themes/textstyles.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onTap;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColorLight,
          ),
          SizedBox(width: 20.w),
          Text(
            title,
            style: Textstyles.m
                .copyWith(color: Theme.of(context).primaryColorLight),
          ),
        ],
      ),
    );
  }
}

class ItemProperties {
  final String title;
  final IconData icon;
  final void Function() onTap;
  const ItemProperties({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
