import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../utils/size/text_field_size.dart';
import '../../../colors/colors.dart';
import '../gap/a_gap.dart';

// ignore: must_be_immutable
class ATextField extends StatefulWidget {
  String name;
  String hintText;
  String? labelText;
  String? helperText;
  String? errorText;
  FocusNode? focusNode;
  Color? color;
  Color? backgroundColor;
  Color? disabledBackgroundColor;
  Color? borderColor;
  Color? focusedBorderColor;
  Color? errorBackgroundColor;
  Color? errorBorderColor;
  Color? cursorColor;
  Color? labelColor;
  double? borderRadius;
  double? height;
  double? width;
  TextEditingController? controller;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? isAutoFocus;
  bool? isObscureText;
  bool isEnabled;
  bool? isCapital;
  bool? isReadOnly;
  bool? showCursor;
  TextInputType? inputType;
  List<TextInputFormatter>? inputFormatter;
  Function(String?)? onChange;
  String? Function(String?)? onValidate;
  Function(String?)? onSaved;
  Function(String?)? onSubmitted;
  String? initialValue;
  TextFieldSize? size;
  int? minLines;
  int? maxLines;
  int? maxLength;
  bool? isRequired;

  ATextField(
      {Key? key,
      required this.name,
      required this.hintText,
      this.labelText,
      this.helperText,
      this.errorText,
      this.focusNode,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.minLines = 1,
      this.maxLines = 1,
      this.maxLength,
      this.color,
      this.backgroundColor,
      this.borderColor,
      this.focusedBorderColor,
      this.errorBackgroundColor,
      this.errorBorderColor,
      this.labelColor,
      this.cursorColor,
      this.borderRadius = 20,
      this.isAutoFocus,
      this.isObscureText = false,
      this.isEnabled = true,
      this.isReadOnly = false,
      this.isRequired = false,
      this.showCursor = true,
      this.height,
      this.width,
      this.isCapital = false,
      this.inputType = TextInputType.text,
      this.inputFormatter,
      this.onChange,
      this.onValidate,
      this.onSaved,
      this.onSubmitted,
      this.initialValue,
      this.size = TextFieldSize.Medium,
      this.disabledBackgroundColor})
      : super(key: key) {
    disabledBackgroundColor =
        disabledBackgroundColor ?? AppColors.gray.shade100;
    borderColor = borderColor ?? AppColors.black.shade200;
    focusedBorderColor = focusedBorderColor ?? AppColors.primary.shade400;
    cursorColor = cursorColor ?? AppColors.primary;
    errorBackgroundColor = AppColors.error.shade100;
    errorBorderColor = AppColors.error.shade600;
    inputFormatter = inputFormatter ?? <TextInputFormatter>[];
  }

  @override
  State<ATextField> createState() => _ATextFieldState();
}

class _ATextFieldState extends State<ATextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null)
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.labelText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: widget.labelColor ?? (Get.isDarkMode ? AppColors.white : AppColors.black)),
                    ),
                    if (widget.isRequired == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '*',
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: AppColors.error),
                        ),
                      )
                  ],
                ),
                AGap(
                  height: 10,
                )
              ],
            ),
          FormBuilderTextField(
            name: widget.name,
            textAlign: TextAlign.left,
            obscureText: widget.isObscureText!,
            readOnly: widget.isReadOnly!,
            enabled: widget.isEnabled,
            showCursor: widget.showCursor,
            onSaved: widget.onSaved,
            onSubmitted: widget.onSubmitted,
            autofocus: widget.isAutoFocus != null ? widget.isAutoFocus! : false,
            validator: widget.onValidate,
            textCapitalization:
                widget.isObscureText == true || widget.isCapital == false
                    ? TextCapitalization.none
                    : TextCapitalization.sentences,
            keyboardType: widget.inputType,
            inputFormatters: widget.inputFormatter,
            onChanged: widget.onChange != null ? widget.onChange! : (_) => {},
            cursorColor: widget.cursorColor,
            controller: widget.controller,
            focusNode: widget.focusNode,
            minLines: widget.minLines ?? 1,
            maxLines: widget.maxLines ?? 1,
            maxLength: widget.maxLength,
            style: context.textTheme.bodyMedium?.copyWith(color: Get.isDarkMode ? AppColors.white : AppColors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.isEnabled
                  ? (widget.backgroundColor ?? (Get.isDarkMode ? AppColors.black.shade400 : AppColors.white))
                  : widget.disabledBackgroundColor,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              prefixIcon: widget.prefixIcon != null
                  ? Container(child: widget.prefixIcon!)
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? Container(child: widget.suffixIcon!)
                  : null,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  color: AppColors.gray.shade300,
                  fontWeight: FontWeight.normal),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: widget.errorBorderColor!, width: 1),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              errorMaxLines: 2,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.focusedBorderColor!,
                  width: 2,
                ),
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor!, width: 1),
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor!, width: 1),
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 10.0),
              ),
            ),
          ),
          if (widget.helperText != null)
            Column(
              children: [
                AGap(
                  height: 5,
                ),
                Text(
                  widget.helperText!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.primary.shade300),
                ),
              ],
            ),
        ]);
  }
}
