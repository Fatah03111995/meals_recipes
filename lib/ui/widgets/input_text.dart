import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool isVisible;
  final void Function(String?) onChanged;
  const InputText(
      {super.key,
      required this.label,
      required this.hint,
      required this.icon,
      required this.onChanged,
      this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(bottom: 10.h),
        height: 50.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: TextField(
          onChanged: onChanged,
          obscureText: !isVisible,
          style: Textstyles.sm.copyWith(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: Textstyles.smBold,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            hintText: hint,
            hintStyle: Textstyles.sm.copyWith(color: Colors.black38),
            prefixIcon: Align(
              alignment: Alignment.center,
              child: Icon(icon),
            ),
            prefixIconColor: Colors.black,
            prefixIconConstraints:
                BoxConstraints(maxWidth: 40.w, maxHeight: 30.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.w),
              borderSide: const BorderSide(
                color: Colors.black38,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.w),
              borderSide: const BorderSide(color: Colors.black, width: 1),
            ),
          ),
        ),
      )
    ]);
  }
}
