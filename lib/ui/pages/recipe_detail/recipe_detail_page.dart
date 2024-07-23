// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/lib.dart';

class RecipeDetailPage extends StatelessWidget {
  final Meal data;
  const RecipeDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      MyTheme appColor = state.modeThemes;
      return Scaffold(
        backgroundColor: appColor.scaffoldBgColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CachedNetworkImage(
                imageUrl: data.imageUrl,
                height: 250.h,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              width: 320.w,
              height: double.infinity,
              margin: EdgeInsets.only(top: 150.h, bottom: 20.h),
              decoration: BoxDecoration(
                  color: appColor.containerColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20.w)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    SizedBox(
                      height: 70.h,
                      child: Flexible(
                        child: Text(
                          data.title,
                          style: Textstyles.lBold
                              .copyWith(color: appColor.textColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: appColor.textColor,
                              size: 20,
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
                              size: 20,
                            ),
                            Text(
                              ' ${data.complexity.name}',
                              style: Textstyles.sm
                                  .copyWith(color: appColor.textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: appColor.textColor,
                          size: 20,
                        ),
                        Text(
                          ' ${data.affordability.name}',
                          style:
                              Textstyles.sm.copyWith(color: appColor.textColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Ingredients',
                      style:
                          Textstyles.mBold.copyWith(color: appColor.textColor),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 250.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (final (index, ingredient)
                              in data.detailIngredients.indexed)
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${index + 1}.',
                                    style: Textstyles.sm
                                        .copyWith(color: appColor.textColor),
                                  ),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                    child: Text(
                                      ingredient,
                                      style: Textstyles.sm
                                          .copyWith(color: appColor.textColor),
                                    ),
                                  )
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Steps',
                      style:
                          Textstyles.mBold.copyWith(color: appColor.textColor),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 250.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (final (index, step) in data.steps.indexed)
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${index + 1}.',
                                    style: Textstyles.sm
                                        .copyWith(color: appColor.textColor),
                                  ),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                    child: Text(
                                      step,
                                      style: Textstyles.sm
                                          .copyWith(color: appColor.textColor),
                                    ),
                                  )
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h)
                  ],
                ),
              ),
            ),
            Positioned(
              top: 125.h,
              child: BlocSelector<UserBloc, UserState, List<String>>(
                selector: (state) {
                  if (state is UserStateDone) {
                    return state.user.favourite;
                  }
                  return [];
                },
                builder: (context, userFav) {
                  bool isLove = userFav.contains(data.id);

                  return GestureDetector(
                    onTap: () {
                      context
                          .read<UserBloc>()
                          .add(UserEventChangeFavorite(id: data.id));
                    },
                    child: Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(5.w)),
                        child: Icon(
                          Icons.favorite,
                          color: isLove ? Colors.red : Colors.white,
                        )),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
