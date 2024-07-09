import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/user/user.dart';
import 'package:meals_recipes/core/routes/path_route.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/pages/profile/widgets/profile_item.dart';
import 'package:meals_recipes/ui/widgets/generated/assets.gen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemProperties> itemsProperties = [
      ItemProperties(title: 'Your Recipies', icon: Icons.receipt, onTap: () {}),
      ItemProperties(
          title: 'Notification', icon: Icons.notifications, onTap: () {}),
      ItemProperties(title: 'Dark Mode', icon: Icons.mode_night, onTap: () {}),
      ItemProperties(title: 'Language', icon: Icons.translate, onTap: () {}),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: kToolbarHeight),
            ClipOval(
              child: Assets.ui.defaultpp.image(
                width: 100.w,
                height: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Abdul Fatah',
              style: Textstyles.l.copyWith(color: Colors.white),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30.w),
            ),
          ),
          child: Column(
            children: List.generate(itemsProperties.length, (index) {
              return Column(
                children: [
                  ProfileItem(
                    title: itemsProperties[index].title,
                    icon: itemsProperties[index].icon,
                    onTap: itemsProperties[index].onTap,
                  ),
                  index < itemsProperties.length - 1
                      ? Divider(
                          height: 5.h,
                        )
                      : SizedBox(
                          height: 5.h,
                        )
                ],
              );
            }),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30.w),
              ),
            ),
            child: ProfileItem(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () {
                context.read<UserBloc>().add(UserEventSignOut());
                Navigator.pushNamed(context, PathRoute.signIn);
              },
            ))
      ],
    );
  }
}
