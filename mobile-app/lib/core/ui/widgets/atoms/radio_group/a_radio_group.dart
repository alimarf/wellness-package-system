import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../colors/colors.dart';
import '../../../constants/sizes.dart';
import '../gap/a_gap.dart';

class RadioGroupOption {
  String value;
  String text;

  RadioGroupOption({required this.value, required this.text});

  factory RadioGroupOption.fromJson(Map<String, dynamic> json) {
    return RadioGroupOption(value: json['value'], text: json['text']);
  }

  Map<String, dynamic> toJson() => {'value': value, 'text': text};
}

// ignore: must_be_immutable
class ARadioGroup extends StatefulWidget {
  String name;
  GlobalKey<FormBuilderState>? formKey;
  String hintText;
  String? labelText;
  String? helperText;
  String? errorText;
  FocusNode? focusNode;
  bool? isEnabled;
  bool? isRequired;
  TextEditingController? controller;
  Widget? prefixIcon;
  Widget? suffixIcon;
  RadioGroupOption? selectedOption;
  List<RadioGroupOption> itemList;
  String? Function(String?)? onValidate;
  Function(String?)? onSaved;
  Function(RadioGroupOption)? onChange;

  ARadioGroup({
    Key? key,
    required this.name,
    required this.hintText,
    this.formKey,
    this.labelText,
    this.helperText,
    this.errorText,
    this.focusNode,
    this.isEnabled,
    this.isRequired,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onValidate,
    this.onSaved,
    this.onChange,
    this.selectedOption,
    required this.itemList,
  }) : super(key: key) {
    suffixIcon = suffixIcon ??
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.gray.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              CupertinoIcons.chevron_down,
              size: 18,
            ),
          ),
        );
    controller = controller ?? TextEditingController();
  }

  @override
  State<ARadioGroup> createState() => _ASelectBoxState();
}

class _ASelectBoxState extends State<ARadioGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText ?? '',
          style: Get.context!.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        AGap(
          height: AppSizes.smallMargin,
        ),
        FormBuilderRadioGroup(
            name: widget.name,
            orientation: OptionsOrientation.vertical,
            activeColor: AppColors.primary,
            enabled: widget.isEnabled ?? true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                fillColor: AppColors.primary,
                focusColor: AppColors.primary,
                iconColor: AppColors.primary,
                hoverColor: AppColors.primary,
                border: InputBorder.none),
            options: widget.itemList
                .map((item) => FormBuilderFieldOption(
                    value: item.text.toString(), child: Text(item.text)))
                .toList(),
            onChanged: (value) {
              if (widget.onChange == null) {
                return;
              }

              final item =
                  widget.itemList.firstWhereOrNull((item) => item.value == value);

              if(item == null || widget.onChange == null) {
                return;
              }

              // String? currentValue =
              //     widget.formKey?.currentState?.getRawValue(widget.name);
              // if (currentValue == value) {
              //   return;
              // }

              widget.onChange!(item);
            },
            validator: (value) => widget.onValidate != null
                ? widget.onValidate!(value.toString())
                : null)
      ],
    );
  }
}
