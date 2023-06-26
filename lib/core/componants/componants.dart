
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toursim/core/utils/color_manager.dart';

Widget myFromField(
    {required BuildContext context,
      required TextEditingController controller,
      TextInputType? keyboardType,
      Function(String)? onSubmit,
      Function(String)? onChange,
      String? Function(String?)? validator,
      String? labelText,
      String? hintText,
      IconData? prefix,
      IconData? suffix,
      Function()? suffixOnPressed,
      Function()? onTap,
      bool isPassword = false,
      TextInputAction? action,
      int? maxLength,
      int? minLines,
      int maxLines = 1,
      List<TextInputFormatter>? formatter,
      bool autoFocus = false,
      bool readOnly = false,
      TextAlign textAlign = TextAlign.start,
      Color fillColor=ColorsManager.fill,
    }) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validator,
      onTap: onTap,
      readOnly: readOnly,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      textAlign: textAlign,
      obscureText: isPassword,
      inputFormatters: formatter,
      autofocus: autoFocus,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        labelText: labelText,
        hintText: hintText,
        labelStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(
        fontSize: 16),
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: prefix != null
            ? Icon(
          prefix,
        )
            : null,
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(
            suffix,
          ),
          onPressed: suffixOnPressed,
        )
            : null,
        enabledBorder:  OutlineInputBorder(
            borderSide:  BorderSide(color: Theme.of(context).iconTheme.color!, width: 1),
            borderRadius: BorderRadius.circular(25),),
        disabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(25),),
        focusedBorder: OutlineInputBorder(
            borderSide:  const BorderSide(color: ColorsManager.primary, width: 2),
            borderRadius: BorderRadius.circular(25)),

      ),

      style:
      Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorsManager.black),
      textDirection: TextDirection.ltr,
      textInputAction: action,
    );
