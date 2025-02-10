import 'package:flutter/material.dart';
import 'package:fruit_hub_dash/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChecked});

  final bool isChecked;

  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        onChecked(!isChecked);
      },
      child: AnimatedContainer(
          width: 24,
          height: 24,
          duration: const Duration(milliseconds: 100),
          decoration: ShapeDecoration(
              color: isChecked ? AppColors.primaryColor : Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.50,
                    color: isChecked ? Colors.transparent : Color(0xffDCDEDE),
                  ),
                  borderRadius: BorderRadius.circular(8))),
          child: isChecked
              ? Icon(Icons.check,color: Colors.white,)
              : const SizedBox()),
    );
  }
}
