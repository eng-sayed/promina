import 'package:promina/core/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  double? height,
  Color textColor = Colors.white,
  bool isUpperCase = true,
  double radius = 8.0,
  double? fontSize,
  String? fontFamily,
  required Function function,
  required String text,
}) =>
    Container(
      clipBehavior: Clip.hardEdge,
      width: width,
      height: height ?? 60,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
        ),
        onPressed: () {
          function();
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: fontSize ?? 18,
                fontFamily: fontFamily,
                color: textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: AppColors.primiry,
      ),
    );
