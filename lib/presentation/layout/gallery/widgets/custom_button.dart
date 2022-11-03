import 'package:flutter/material.dart';

import '../../../componants/customtext.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.function,
      required this.imageName,
      this.textStyleEnum,
      this.width,
      this.height,
      this.size})
      : super(
          key: key,
        );
  final Color color;
  final String text;
  final String imageName;
  final Function function;
  TextStyleEnum? textStyleEnum;
  double? size;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              Image.asset('assets/images/${imageName}.png'),
              SizedBox(
                width: 10,
              ),
              CustomText(
                '${text}',
                textStyleEnum: textStyleEnum ?? TextStyleEnum.normal,
                fontsize: size ?? 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
