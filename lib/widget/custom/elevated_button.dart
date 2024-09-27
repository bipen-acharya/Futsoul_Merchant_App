import 'package:flutter/material.dart';
import 'package:futsoul_merchant/utils/colors.dart';
import 'package:futsoul_merchant/utils/custom_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double height;
  final bool isDisabled;
  final Color? backGroundColor;
  final Color? textColor;
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.height = 50,
      this.isDisabled = false,
      this.backGroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.lGrey,
            backgroundColor: backGroundColor,
            minimumSize: Size.fromHeight(height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: isDisabled ? null : onTap,
        child: Text(
          title,
          style: CustomTextStyles.f16W600(color: textColor ?? Colors.white),
        ));
  }
}
