import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:meals_recipes/lib.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        MyTheme appColor = state.modeThemes;
        return Scaffold(
          backgroundColor: appColor.scaffoldBgColor,
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
                    color: appColor.primaryColor.withOpacity(0.7),
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
                                icon: Icon(
                                  Ionicons.logo_google,
                                  color: appColor.textColor,
                                  size: 40.w,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Ionicons.logo_apple,
                                  color: appColor.textColor,
                                  size: 40.w,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Ionicons.logo_facebook,
                                  color: appColor.textColor,
                                  size: 40.w,
                                )),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Expanded(child: Divider(color: appColor.textColor)),
                            Expanded(
                              child: Text(
                                ' or using email account ',
                                style: Textstyles.s
                                    .copyWith(color: appColor.textColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(child: Divider(color: appColor.textColor)),
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
                        SizedBox(height: 10.h),
                        InputText(
                          label: 'password',
                          hint: 'keep secret !',
                          icon: Icons.lock,
                          isVisible: false,
                          onChanged: (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'forgot password ?',
                            style: Textstyles.s
                                .copyWith(color: appColor.textColor),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        BlocConsumer<UserBloc, UserState>(
                          listener: (context, state) {
                            if (state is UserStateDone) {
                              Navigator.pushReplacementNamed(
                                  context, PathRoute.dashboard);
                            }
                          },
                          builder: (context, state) {
                            return RoundedRectangleButton(
                                titleButton: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (state is UserStateLoading)
                                      CircularProgressIndicator(
                                        color: appColor.secondaryColor,
                                      ),
                                    if (state is! UserStateLoading)
                                      Text('Sign In',
                                          style: Textstyles.smBold.copyWith(
                                            color: MyColors.dark100,
                                          ))
                                  ],
                                ),
                                text: '',
                                onTap: () {
                                  SignInState state =
                                      context.read<SignInBloc>().state;

                                  context.read<UserBloc>().add(UserEventSignIn(
                                      email: state.email,
                                      password: state.password));
                                });
                          },
                        ),
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
      },
    );
  }
}
