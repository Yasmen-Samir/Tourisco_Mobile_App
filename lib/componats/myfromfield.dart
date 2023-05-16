import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/utils/color_manager.dart';

class MyFromField extends StatefulWidget {
  late TextEditingController controller;
  TextInputType? keyboardType;
  Function(String)? onSubmit;
  Function(String)? onChange;
  String? Function(String?)? validator;
  String? labelText;
  String? hintText;
  IconData? prefix;
  IconData? suffix;
  Function()? suffixOnPressed;
  Function()? onTap;
  bool isPassword = false;
  TextInputAction? action;
  int? maxLength;
  int? minLines;
  late int maxLines;
  List<TextInputFormatter>? formatter;
  late bool autoFocus;
  late bool readOnly;

  TextAlign textAlign = TextAlign.start;

  MyFromField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.onSubmit,
    this.onChange,
    this.validator,
    this.labelText,
    this.hintText,
    this.prefix,
    this.suffix,
    this.suffixOnPressed,
    this.onTap,
    this.isPassword = false,
    this.action,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.formatter,
    this.autoFocus = false,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
  });

  @override
  State<MyFromField> createState() => _MyFromFieldState();
}

class _MyFromFieldState extends State<MyFromField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      onFieldSubmitted: widget.onSubmit,
      onChanged: widget.onChange,
      validator: widget.validator,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      obscureText: widget.isPassword,
      inputFormatters: widget.formatter,
      autofocus: widget.autoFocus,
      decoration: InputDecoration(
        fillColor: ColorsManager.fill,
        filled: true,
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Colors.white),
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: widget.prefix != null
            ? Icon(
          widget.prefix,
              )
            : null,
        suffixIcon: widget.suffix != null
            ? IconButton(
                icon: Icon(
                  widget.suffix,
                ),
                onPressed: widget.suffixOnPressed,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
            gapPadding: 12,
            borderSide: const BorderSide(width: 2),
            borderRadius: BorderRadius.circular(25)),
        focusColor: Colors.red,
      ),
      style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
      textDirection: TextDirection.ltr,
      textInputAction: widget.action,
    );
  }
}
