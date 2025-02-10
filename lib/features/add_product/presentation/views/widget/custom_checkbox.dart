import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dash/core/utils/app_colors.dart';
import 'package:fruit_hub_dash/core/utils/app_text_styles.dart';
import 'package:fruit_hub_dash/features/add_product/presentation/views/widget/custom_check_box.dart';

class ChecBoxWidget extends StatefulWidget {
  const ChecBoxWidget({super.key, required this.onChanged, required this.text});

  final ValueChanged<bool> onChanged;
   final String text;
  @override
  State<ChecBoxWidget> createState() => _ChecBoxWidgetState();
}

class _ChecBoxWidgetState extends State<ChecBoxWidget> {
  bool isTermsAccepted = false;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: widget.text,
                style: TextStyles.semiBold13
                    .copyWith(color: const Color(0xff949D9E)),
              ),

            ],
          ),
        ),
         Expanded(child: SizedBox(width: 16)),
        CustomCheckBox(
            isChecked: isTermsAccepted,
            onChecked: (value) {
              isTermsAccepted = value;
              widget.onChanged(value);
              setState(() {});
            }),


      ],
    );
  }
}
