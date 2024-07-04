import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/pages/signup/bloc/bloc.dart';
import 'package:meals_recipes/ui/widgets/generated/assets.gen.dart';
import 'package:meals_recipes/ui/widgets/input_text.dart';
import 'package:meals_recipes/ui/widgets/rounded_rectangle_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 130.w,
              height: double.infinity,
              child: RotatedBox(
                quarterTurns: 1,
                child: Stack(
                  children: [
                    Assets.ui.bg
                        .image(fit: BoxFit.cover, width: double.infinity),
                    Positioned(
                      left: 50.h,
                      top: 30.w,
                      child: Text(
                        'Sign Up',
                        style: Textstyles.xxlBold.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // ---------------------------------------------- INPUT -----------------------------------
          Center(
            child: Container(
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.w),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                child: Column(
                  children: [
                    InputText(
                      label: 'username',
                      hint: 'example_cool',
                      icon: Icons.person,
                      onChanged: (value) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpUsernameEvent(value));
                      },
                    ),
                    InputText(
                      label: 'e-mail',
                      hint: 'example@email.com',
                      icon: Icons.mail,
                      onChanged: (value) {
                        context.read<SignUpBloc>().add(SignUpEmailEvent(value));
                      },
                    ),
                    InputText(
                      label: 'password',
                      hint: 'keep secret !',
                      icon: Icons.lock,
                      isVisible: false,
                      onChanged: (value) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpPasswordEvent(value));
                      },
                    ),
                    InputText(
                      label: 'confirm password',
                      hint: 'keep secret !',
                      icon: Icons.lock,
                      isVisible: false,
                      onChanged: (value) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpConfirmPasswordEvent(value));
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
                      text: 'Sign Up',
                      onTap: () {
                        SignUpState state = context.read<SignUpBloc>().state;
                        print(state);
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
