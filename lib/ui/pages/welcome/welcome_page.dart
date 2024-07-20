import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/routes/path_route.dart';
import 'package:meals_recipes/core/themes/my_colors.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/global.dart';
import 'package:meals_recipes/ui/pages/welcome/bloc/welcome_bloc.dart';
import 'package:meals_recipes/ui/pages/welcome/bloc/welcome_event.dart';
import 'package:meals_recipes/ui/pages/welcome/bloc/welcome_state.dart';
import 'package:meals_recipes/ui/widgets/generated/assets.gen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageViewController = PageController();
    List<Widget> listPageView = [
      _pageViewItem(
        image: Assets.ui.employee6.image(
          width: 300.w,
          height: 300.w,
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
        title: 'Share Your Recipies',
      ),
      _pageViewItem(
        image: Assets.ui.employee1.image(
          width: 300.w,
          height: 300.w,
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
        title: 'Try Cooking from Another World Meals',
      ),
      _pageViewItem(
        image: Assets.ui.employee5.image(
          width: 300.w,
          height: 300.w,
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
        title: 'Having Fun on Your Trial',
      )
    ];

    return Scaffold(
      backgroundColor: MyColors.blue4,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: kToolbarHeight + 70.h, right: 15.w, left: 15.w),
              width: 320.w,
              child: BlocBuilder<WelcomeBloc, WelcomeState>(
                builder: (context, state) {
                  return PageView(
                    controller: pageViewController,
                    onPageChanged: (index) {
                      context
                          .read<WelcomeBloc>()
                          .add(ChangeIndex(index: index));
                    },
                    children: listPageView,
                  );
                },
              ),
            ),
            BlocBuilder<WelcomeBloc, WelcomeState>(
              builder: (context, state) {
                int index = state.index;
                bool isEndIndex = state.index == listPageView.length - 1;

                return Positioned(
                    bottom: 130.h,
                    child: SizedBox(
                      width: 300.w,
                      height: 50.h,
                      child: Material(
                        color: MyColors.blue1,
                        borderRadius: BorderRadius.circular(20.w),
                        child: InkWell(
                          onTap: isEndIndex
                              ? () {
                                  Global.globalPreferences
                                      .setIsDeviceFirstOpen(false);
                                  Navigator.pushReplacementNamed(
                                      context, PathRoute.signIn);
                                }
                              : () => pageViewController.animateToPage(
                                    index + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate,
                                  ),
                          splashColor: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.w),
                          child: Center(
                            child: Text(
                              isEndIndex ? 'Get Started' : 'Continue',
                              style: Textstyles.mBold
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ));
              },
            ),
            BlocBuilder<WelcomeBloc, WelcomeState>(
              builder: (context, state) {
                return Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      dotsCount: listPageView.length,
                      position: state.index,
                      decorator: DotsDecorator(
                        size: Size(8.w, 8.w),
                        activeColor: MyColors.blue1,
                        activeSize: Size(16.w, 8.w),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _pageViewItem({
    required Image image,
    required String title,
  }) {
    return Center(
      child: Column(
        children: [
          image,
          SizedBox(
            height: 40.h,
          ),
          Flexible(
            child: Text(
              title,
              style: Textstyles.ml.copyWith(color: MyColors.blue1),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
