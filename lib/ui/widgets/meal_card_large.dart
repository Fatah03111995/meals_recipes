import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/theme/theme_cubit.dart';
import 'package:meals_recipes/core/data/models/meals_model.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';

class MealCardLarge extends StatelessWidget {
  final Meal data;
  const MealCardLarge({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    MyTheme appColor = context.watch<ThemeCubit>().state.modeThemes;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: appColor.containerColor,
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: data.imageUrl,
            height: 300.h,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            placeholder: (context, string) {
              return CircularProgressIndicator(
                color: appColor.textColor,
              );
            },
            errorWidget: (context, url, err) => Icon(
              Icons.error,
              color: appColor.textColor,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: appColor.containerColor.withOpacity(0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      data.title,
                      style:
                          Textstyles.mBold.copyWith(color: appColor.textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: appColor.textColor,
                            size: 15,
                          ),
                          Text(
                            ' ${data.duration} mnt',
                            style: Textstyles.sm
                                .copyWith(color: appColor.textColor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.work,
                            color: appColor.textColor,
                            size: 15,
                          ),
                          Text(
                            ' ${data.complexity.name}',
                            style: Textstyles.sm
                                .copyWith(color: appColor.textColor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: appColor.textColor,
                            size: 15,
                          ),
                          Text(
                            ' ${data.affordability.name}',
                            style: Textstyles.sm
                                .copyWith(color: appColor.textColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h)
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(5.w)),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
