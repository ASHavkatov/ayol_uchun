import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginTextFormField extends StatefulWidget {
  LoginTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.isValid,
    this.autoValidateMode = AutovalidateMode.onUnfocus,
    required this.fontWeight,
    required this.color,
    required this.size,
    this.svg,
    required this.prefixSvg,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;
  final FontWeight fontWeight;
  final Color color;
  final bool? isValid;
  final AutovalidateMode autoValidateMode;
  final double size;
  final String? svg;
  final String prefixSvg;



  @override
  State<LoginTextFormField> createState() => _LoginTextFormFieldState();
}

class _LoginTextFormFieldState extends State<LoginTextFormField> {
  bool _isObscured = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            autovalidateMode: widget.autoValidateMode,
            obscureText: _isObscured,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SvgPicture.asset(
                  widget.prefixSvg,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              suffixIcon: widget.svg != null
                  ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: SvgPicture.asset(
                    widget.svg!,
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )
                  : null,

              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 14,
              ),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16.r),
              errorStyle: TextStyle(
                fontSize: widget.size,
                fontWeight: FontWeight.w500,
              ),
              hintText: widget.hintText,
            ),
          ),

        ),
      ],
    );
  }
}
