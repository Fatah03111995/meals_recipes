import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/routes/path_route.dart';
import 'package:meals_recipes/core/themes/my_colors.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/pages/signin/bloc/sign_in_bloc.dart';
import 'package:meals_recipes/ui/pages/signin/bloc/sign_in_event.dart';
import 'package:meals_recipes/ui/pages/signin/bloc/sign_in_state.dart';
import 'package:meals_recipes/ui/widgets/generated/assets.gen.dart';
import 'package:meals_recipes/ui/widgets/input_text.dart';
import 'package:meals_recipes/ui/widgets/rounded_rectangle_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: kToolbarHeight + 150.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.ui.bg.provider(),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10.w),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.blue1.withOpacity(0.7),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Assets.ui.logo.image(
                    width: 50.w,
                    height: 50.w,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'WELCOME',
                    style: Textstyles.mlBold.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // -------------------------------- INPUT -------------------------
          Expanded(
            child: SizedBox(
              width: 300.w,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon:
                              Assets.ui.google.image(width: 40.w, height: 40.w),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.ui.facebook
                              .image(width: 40.w, height: 40.w),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon:
                              Assets.ui.apple.image(width: 40.w, height: 40.w),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Expanded(
                          child: Text(
                            ' or using email account ',
                            style: Textstyles.s.copyWith(color: Colors.black38),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(child: Divider())
                      ],
                    ),
                    SizedBox(height: 30.h),
                    InputText(
                      label: 'e-mail',
                      hint: 'example@email.com',
                      icon: Icons.person,
                      onChanged: (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      },
                    ),
                    InputText(
                      label: 'password',
                      hint: 'keep secret !',
                      icon: Icons.lock,
                      isVisible: false,
                      onChanged: (value) {
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'forgot password ?',
                        style: Textstyles.s,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    RoundedRectangleButton(
                        text: 'Sign In',
                        onTap: () {
                          SignInState state = context.read<SignInBloc>().state;
                          print(state);
                        }),
                    SizedBox(height: 20.h),
                    RoundedRectangleButton(
                      text: 'Sign Up',
                      onTap: () {
                        Navigator.pushNamed(context, PathRoute.signUp);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
