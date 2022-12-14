import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/themes/colors.dart';

class DefaultTextField extends StatefulWidget {
  DefaultTextField({
    Key? key,
    this.controller,
    required this.keyboardType,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.border,
    this.minlines,
    this.maxlines,
    this.height,
    this.enable,
    this.onChange,
    required this.validate,
    this.focusNode,
  }) : super(key: key);
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController? controller;
  String? label;
  String? hintText;
  double? height;
  String? Function(String?) validate;
  FocusNode? focusNode;
  InputBorder? border;
  int? minlines;
  int? maxlines;
  bool? enable;
  Function(String)? onChange;
  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool? isPass;
  bool? visible;
  @override
  void initState() {
    isPass =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
    visible = isPass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: SizedBox(
        height: widget.height ?? 46,
        child: TextFormField(
            onChanged: widget.onChange,
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: visible!,
            minLines: widget.minlines,
            maxLines: widget.maxlines ?? 1,
            enabled: widget.enable,
            style: TextStyle(color: AppColors.grey),
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: AppColors.white)),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                fillColor: Colors.white,
                filled: true,
                hintText: widget.hintText,
                suffixIcon: widget.suffixIcon ??
                    (isPass!
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible!;
                              });
                            },
                            icon: Icon(
                              visible!
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              // color: Colors.black,
                            ),
                          )
                        : widget.suffixIcon),
                labelText: widget.label,
                border: widget.border ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: AppColors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: AppColors.white))),
            validator: widget.validate),
      ),
    );
  }
}
