import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../colors/colors.dart';
import '../../../constants/sizes.dart';
import '../bottom_sheet/a_bottom_sheet.dart';
import '../button/a_primary_button.dart';
import '../gap/a_gap.dart';
import '../select_box/a_select_box.dart';
import '../text/a_text.dart';
import '../textfield/a_text_field.dart';

// ignore: must_be_immutable
class AGridMultiSelectBox extends StatefulWidget {
  SelectBoxType? type;
  String name;
  String hintText;
  String? labelText;
  String? helperText;
  String? errorText;
  FocusNode? focusNode;
  GlobalKey<FormBuilderState>? formKey;
  Widget? prefixIcon;
  Widget? suffixIcon;
  SelectBoxOption? selectedOption;
  List<SelectBoxOption> itemList;
  bool isEnabled;
  bool isRequired;
  bool showSearch;
  String? Function(String?)? onValidate;
  Function(String?)? onSaved;
  Function(List<SelectBoxOption>)? onChange;

  AGridMultiSelectBox({
    Key? key,
    required this.name,
    required this.hintText,
    this.isEnabled = true,
    this.isRequired = false,
    this.type = SelectBoxType.BottomSheet,
    this.labelText,
    this.helperText,
    this.errorText,
    this.focusNode,
    this.formKey,
    this.prefixIcon,
    this.suffixIcon,
    this.showSearch = false,
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
  }

  @override
  State<AGridMultiSelectBox> createState() => _AGridMultiSelectBoxState();
}

class _AGridMultiSelectBoxState extends State<AGridMultiSelectBox> {
  List<SelectBoxOption> _selectedItems = [];

  Future<void> showItemList() async {
    FocusManager.instance.primaryFocus?.unfocus();

    dynamic selectedResult;
    List<SelectBoxOption>? selectedBoxOptions;

    switch (widget.type) {
      case SelectBoxType.BottomSheet:
        selectedResult = await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            backgroundColor: Colors.transparent,
            builder: (_) {
              String keyword = "";
              List<SelectBoxOption> filteredItemList = widget.itemList
                  .where((item) =>
                      item.text!.toLowerCase().contains(keyword.toLowerCase()))
                  .toList();

              return ABottomSheet(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.hintText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  AGap(
                    height: 20,
                  ),
                  StatefulBuilder(builder: (BuildContext context, setState) {
                    return Column(
                      children: [
                        if (widget.showSearch)
                          ATextField(
                            name: 'keyword',
                            hintText: 'Cari',
                            isRequired: widget.isRequired,
                            onChange: (value) => setState(() {
                              if (value == null) {
                                return;
                              }

                              keyword = value;
                              filteredItemList = widget.itemList
                                  .where((item) => item.text!
                                      .toLowerCase()
                                      .contains(keyword.toLowerCase()))
                                  .toList();
                            }),
                          ),
                        filteredItemList.isNotEmpty
                            ? GridView.count(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0, 
                                    mainAxisSpacing: 8.0, 
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    childAspectRatio: 2.0,
                                    children: filteredItemList.map((item) {
                                      bool isSelected = _selectedItems.contains(item);
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelected) {
                                              _selectedItems.remove(item);
                                            } else {
                                              _selectedItems.add(item);
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            color: isSelected ? AppColors.primary : AppColors.neutralLight,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: isSelected ? Colors.transparent : AppColors.neutralDark,
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              if (isSelected)
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 2), // Position of the shadow
                                                ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              item.text ?? '-',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: isSelected ? AppColors.white : AppColors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  )
                            : Padding(
                                padding:
                                    EdgeInsets.only(top: AppSizes.margin),
                                child: AText(
                                  'Data not found',
                                  style: Get.context!.textTheme.bodyLarge,
                                ),
                              ),
                            AGap(height: 24),
                            APrimaryButton(
                              text: 'Submit',
                              onClick: () {
                                print(_selectedItems);
                                Navigator.of(context).pop(_selectedItems);
                              },
                            )
                      ],
                    );
                  }),
                ],
              ));
            });

        if (selectedResult is List<SelectBoxOption>) {
          selectedBoxOptions = selectedResult;
        }

        break;
      case SelectBoxType.Dialog:
        selectedResult =
            await Get.dialog(StatefulBuilder(builder: (context, setState) {
          String keyword = "";
          List<SelectBoxOption> filteredItemList = widget.itemList
              .where((item) =>
                  item.text!.toLowerCase().contains(keyword.toLowerCase()))
              .toList();

          return Material(
            child: Container(
                margin: const EdgeInsets.all(AppSizes.margin),
                decoration: const BoxDecoration(color: AppColors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hintText,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AGap(
                        height: 20,
                      ),
                      StatefulBuilder(
                          builder: (BuildContext context, setState) {
                        return Column(
                          children: [
                            if (widget.showSearch)
                              ATextField(
                                name: 'keyword',
                                hintText: 'Cari',
                                isRequired: widget.isRequired,
                                onChange: (value) => setState(() {
                                  if (value == null) {
                                    return;
                                  }

                                  keyword = value;
                                  filteredItemList = widget.itemList
                                      .where((item) => item.text!
                                          .toLowerCase()
                                          .contains(keyword.toLowerCase()))
                                      .toList();
                                }),
                              ),
                            filteredItemList.isNotEmpty
                                ? GridView.count(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0, 
                                    mainAxisSpacing: 8.0, 
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    childAspectRatio: 2.0,
                                    children: filteredItemList.map((item) {
                                      bool isSelected = _selectedItems.contains(item);
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelected) {
                                              _selectedItems.remove(item);
                                            } else {
                                              _selectedItems.add(item);
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            color: isSelected ? AppColors.primary : AppColors.neutralLight,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: isSelected ? Colors.transparent : AppColors.neutralDark,
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              if (isSelected)
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 2), // Position of the shadow
                                                ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              item.text ?? '-',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: isSelected ? AppColors.white : AppColors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(top: AppSizes.margin),
                                    child: AText(
                                      'Data not found',
                                      style: Get.context!.textTheme.bodyLarge,
                                    ),
                                  ),
                            AGap(height: 24),
                            APrimaryButton(
                              text: 'Submit',
                              onClick: () {
                                Navigator.of(context).pop(_selectedItems);
                              },
                            )
                          ],
                        );
                      }),
                    ],
                  ),
                )),
          );
        }));
        if (selectedResult is List<SelectBoxOption>) {
          selectedBoxOptions = selectedResult;
        }
        break;

      case SelectBoxType.Page:
        selectedResult =
            await Get.dialog(StatefulBuilder(builder: (context, setState) {
          String keyword = "";
          List<SelectBoxOption> filteredItemList = widget.itemList
              .where((item) =>
                  item.text!.toLowerCase().contains(keyword.toLowerCase()))
              .toList();

          return Material(
            child: Container(
                margin: const EdgeInsets.all(AppSizes.margin),
                decoration: const BoxDecoration(color: AppColors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              LucideIcons.chevronLeft,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            widget.hintText,
                            style: Get.context!.textTheme.titleMedium
                                ?.copyWith(color: AppColors.black),
                          ),
                          AGap(
                            width: AppSizes.largeMargin,
                          )
                        ],
                      ),
                      AGap(
                        height: 20,
                      ),
                      StatefulBuilder(
                          builder: (BuildContext context, setState) {
                        return Column(
                          children: [
                            if (widget.showSearch)
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppSizes.margin),
                                child: ATextField(
                                  name: 'keyword',
                                  hintText: 'Search',
                                  isRequired: widget.isRequired,
                                  onChange: (value) => setState(() {
                                    if (value == null) {
                                      return;
                                    }

                                    keyword = value;
                                    filteredItemList = widget.itemList
                                        .where((item) => item.text!
                                            .toLowerCase()
                                            .contains(keyword.toLowerCase()))
                                        .toList();
                                  }),
                                ),
                              ),
                            filteredItemList.isNotEmpty
                                ? GridView.count(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0, 
                                    mainAxisSpacing: 8.0, 
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    childAspectRatio: 2.0,
                                    children: filteredItemList.map((item) {
                                      bool isSelected = _selectedItems.contains(item);
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelected) {
                                              _selectedItems.remove(item);
                                            } else {
                                              _selectedItems.add(item);
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            color: isSelected ? AppColors.primary : AppColors.neutralLight,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: isSelected ? Colors.transparent : AppColors.neutralDark,
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              if (isSelected)
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 2), // Position of the shadow
                                                ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              item.text ?? '-',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: isSelected ? AppColors.white : AppColors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        top: AppSizes.margin),
                                    child: AText(
                                      'Data not found',
                                      style: Get.context!.textTheme.bodyLarge,
                                    ),
                                  ),
                            AGap(height: 24),
                            APrimaryButton(
                              text: 'Submit',
                              onClick: () {
                                Navigator.of(context).pop(_selectedItems);
                              },
                            )
                          ],
                        );
                      }),
                    ],
                  ),
                )),
          );
        }));

        if (selectedResult is List<SelectBoxOption>) {
          selectedBoxOptions = selectedResult;
        }
        break;
      default:
        selectedBoxOptions = [];
    }

    if (selectedBoxOptions != null && selectedBoxOptions.isNotEmpty) {
      setState(() {
        _selectedItems = selectedBoxOptions!;
        widget.selectedOption = selectedBoxOptions.firstOrNull;
        widget.formKey?.currentState?.patchValue(
            {widget.name: selectedBoxOptions.map((e) => e.text).join(', ')});
      });

      if (widget.onChange != null) {
        widget.onChange!(_selectedItems);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: showItemList,
        child: AbsorbPointer(
          child: ATextField(
            name: widget.name,
            hintText: widget.hintText,
            labelText: widget.labelText,
            errorText: widget.errorText,
            focusNode: widget.focusNode,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            isEnabled: widget.isEnabled,
            isRequired: widget.isRequired,
            onValidate: widget.onValidate,
            onSaved: widget.onSaved,
            onChange: widget.onSaved,
          ),
        ));
  }
}
