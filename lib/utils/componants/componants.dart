
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toursim/utils/color_manager.dart';

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
        fillColor: ColorsManager.fill,
        filled: true,
        labelText: labelText,
        hintText: hintText,
        labelStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Colors.black,
        fontSize: 16),
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Colors.black),
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
            borderSide: const BorderSide(color: Colors.white, width: 1),
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
