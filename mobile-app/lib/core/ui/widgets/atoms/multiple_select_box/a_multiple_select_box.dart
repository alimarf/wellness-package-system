import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../colors/colors.dart';
import '../../../constants/sizes.dart';
import '../../moleculs/m_app_bar/m_app_bar.dart';
import '../../organigrams/scaffold/o_scaffold.dart';
import '../bottom_sheet/a_bottom_sheet.dart';
import '../button/a_primary_button.dart';
import '../divider/a_divider.dart';
import '../gap/a_gap.dart';
import '../select_box/a_select_box.dart';
import '../text/a_text.dart';
import '../textfield/a_text_field.dart';

// ignore: must_be_immutable
class AMultiSelectBox extends StatefulWidget {
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
  bool? showClear;
  String? Function(String?)? onValidate;
  Function(String?)? onSaved;
  Function(List<SelectBoxOption>)? onChange;

  AMultiSelectBox({
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
    this.showClear = false,
    this.onValidate,
    this.onSaved,
    this.onChange,
    this.selectedOption,
    required this.itemList,
  }) : super(key: key);

  @override
  State<AMultiSelectBox> createState() => _AMultiSelectBoxState();
}

class _AMultiSelectBoxState extends State<AMultiSelectBox> {
  // List<SelectBoxOption> _selectedItems = [];
  late ValueNotifier<List<SelectBoxOption>> _selectedItemsNotifier;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    _selectedItemsNotifier = ValueNotifier([]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedItemsNotifier.value = widget.formKey?.currentState
                ?.getRawValue(widget.name)
                .toString()
                .replaceAll(', ', ',')
                .split(',')
                .map((selectedItem) {
                  final selectBoxOption = widget.itemList.firstWhereOrNull(
                      (item) =>
                          item.text?.toLowerCase() ==
                          selectedItem.toLowerCase());

                  if (selectBoxOption == null) {
                    return SelectBoxOption();
                  }

                  return selectBoxOption;
                })
                .where((option) => option.text != null)
                .toList() ??
            [];
        log(_selectedItemsNotifier.value.toString());
      });
    });
  }

  void clearSelectedItems() {
    _selectedItemsNotifier.value = [];
    widget.formKey?.currentState?.patchValue({widget.name: ''});
    log("Selected items cleared: ${_selectedItemsNotifier.value}");
  }

  Future<void> showItemList() async {
    FocusManager.instance.primaryFocus?.unfocus();

    dynamic selectedResult;
    List<SelectBoxOption>? selectedBoxOptions;

    if (!isInitialized) {
      setState(() {
        final formSelectedItems = widget.formKey?.currentState
            ?.getRawValue(widget.name)
            .toString()
            .replaceAll(', ', ',')
            .split(',');
        _selectedItemsNotifier.value = formSelectedItems
                ?.map((selectedItem) {
                  final selectBoxOption = widget.itemList.firstWhereOrNull(
                      (item) =>
                          item.text?.toLowerCase() ==
                          selectedItem.toLowerCase());

                  if (selectBoxOption == null) {
                    return SelectBoxOption();
                  }

                  return selectBoxOption;
                })
                .where((option) => option.text != null)
                .toList() ??
            [];
        isInitialized = true;
      });
    }

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
                        filteredItemList.isNotEmpty
                            ? GridView.count(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                childAspectRatio: 2.0,
                                children: filteredItemList.map((item) {
                                  bool isSelected = _selectedItemsNotifier.value
                                      .contains(item);
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _selectedItemsNotifier.value
                                              .remove(item);
                                        } else {
                                          _selectedItemsNotifier.value
                                              .add(item);
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0, horizontal: 4.0),
                                      child: Row(
                                        children: [
                                          if (isSelected)
                                            Icon(
                                              LucideIcons.checkSquare,
                                              size: 20,
                                              color: AppColors.primary.shade800,
                                            )
                                          else
                                            Icon(LucideIcons.square,
                                                size: 20,
                                                color: AppColors.gray),
                                          AGap(width: AppSizes.margin),
                                          Text(
                                            item.text ?? '-',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )
                            : Padding(
                                padding: EdgeInsets.only(top: AppSizes.margin),
                                child: AText(
                                  'Data not found',
                                  style: Get.context!.textTheme.bodyLarge,
                                ),
                              ),
                        AGap(height: 24),
                        APrimaryButton(
                          text: 'Submit',
                          width: context.width,
                          onClick: () {
                            Navigator.of(context)
                                .pop(_selectedItemsNotifier.value);
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
                                hintText: 'Search'.tr,
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    childAspectRatio: 2.0,
                                    children: filteredItemList.map((item) {
                                      bool isSelected = _selectedItemsNotifier
                                          .value
                                          .contains(item);
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelected) {
                                              _selectedItemsNotifier.value
                                                  .remove(item);
                                            } else {
                                              _selectedItemsNotifier.value
                                                  .add(item);
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0, horizontal: 4.0),
                                          child: Row(
                                            children: [
                                              if (isSelected)
                                                Icon(
                                                  LucideIcons.checkSquare,
                                                  size: 20,
                                                  color: AppColors
                                                      .primary.shade800,
                                                )
                                              else
                                                Icon(LucideIcons.square,
                                                    size: 20,
                                                    color: AppColors.gray),
                                              AGap(width: AppSizes.margin),
                                              Text(
                                                item.text ?? '-',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
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
                              width: context.width,
                              onClick: () {
                                Navigator.of(context)
                                    .pop(_selectedItemsNotifier.value);
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
        selectedResult = await Get.to(OScaffold(
            appBar: MAppBar.white(title: widget.hintText, actions: [
              Visibility(
                visible: widget.showClear == true,
                child: GestureDetector(
                  onTap: () {
                    clearSelectedItems();
                  },
                  child: AText('Clear'),
                ),
              ),
            ]),
            backgroundColor: Get.isDarkMode ? AppColors.black : AppColors.white,
            body: ValueListenableBuilder<List<SelectBoxOption>>(
                valueListenable: _selectedItemsNotifier,
                builder: (context, selectedItems, child) {
                  String keyword = "";
                  List<SelectBoxOption> filteredItemList = widget.itemList
                      .where((item) => item.text!
                          .toLowerCase()
                          .contains(keyword.toLowerCase()))
                      .toList();

                  return SizedBox(
                    height: context.height,
                    width: context.width,
                    child: Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.all(AppSizes.margin),
                            decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? AppColors.black
                                    : AppColors.white),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StatefulBuilder(builder:
                                      (BuildContext context, setState) {
                                    return Column(
                                      children: [
                                        if (widget.showSearch)
                                          ATextField(
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
                                                      .contains(keyword
                                                          .toLowerCase()))
                                                  .toList();
                                            }),
                                          ),
                                        filteredItemList.isNotEmpty
                                            ? ListView.separated(
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_selectedItemsNotifier
                                                            .value
                                                            .contains(
                                                                filteredItemList[
                                                                    index])) {
                                                          _selectedItemsNotifier
                                                              .value
                                                              .remove(
                                                                  filteredItemList[
                                                                      index]);
                                                        } else {
                                                          _selectedItemsNotifier
                                                              .value
                                                              .add(
                                                                  filteredItemList[
                                                                      index]);
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Get.isDarkMode
                                                              ? AppColors
                                                                  .transparent
                                                              : AppColors
                                                                  .white),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 2.0,
                                                          horizontal: 4.0),
                                                      child: Row(
                                                        children: [
                                                          if (_selectedItemsNotifier
                                                              .value
                                                              .contains(
                                                                  filteredItemList[
                                                                      index]))
                                                            Icon(
                                                              LucideIcons
                                                                  .checkSquare,
                                                              size: 20,
                                                              color: AppColors
                                                                  .primary
                                                                  .shade800,
                                                            )
                                                          else
                                                            Icon(
                                                                LucideIcons
                                                                    .square,
                                                                size: 20,
                                                                color: AppColors
                                                                    .gray),
                                                          AGap(
                                                              width: AppSizes
                                                                  .margin),
                                                          Text(
                                                            filteredItemList[
                                                                        index]
                                                                    .text ??
                                                                '-',
                                                            style: Get
                                                                .context!
                                                                .textTheme
                                                                .bodyLarge,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) =>
                                                        ADivider(
                                                          margin: const EdgeInsets
                                                              .symmetric(
                                                              vertical: AppSizes
                                                                  .smallMargin),
                                                        ),
                                                itemCount:
                                                    filteredItemList.length)
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: AppSizes.margin),
                                                child: AText(
                                                  'Data not found'.tr,
                                                  style: Get.context!.textTheme
                                                      .bodyLarge,
                                                ),
                                              ),
                                      ],
                                    );
                                  }),
                                  AGap(height: 100),
                                ],
                              ),
                            )),
                        Positioned(
                            bottom: AppSizes.margin,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.margin),
                              width: context.width,
                              color: Get.isDarkMode
                                  ? AppColors.black.shade300
                                  : AppColors.white,
                              child: APrimaryButton(
                                text: 'Submit'.tr,
                                width: context.width,
                                onClick: () {
                                  Navigator.of(context)
                                      .pop(_selectedItemsNotifier.value);
                                },
                              ),
                            ))
                      ],
                    ),
                  );
                })));

        if (selectedResult is List<SelectBoxOption>) {
          selectedBoxOptions = selectedResult;
        }
        break;
      default:
        selectedBoxOptions = [];
    }

    if (selectedBoxOptions != null && selectedBoxOptions.isNotEmpty) {
      setState(() {
        _selectedItemsNotifier.value = selectedBoxOptions!;
        widget.selectedOption = selectedBoxOptions.firstOrNull;
        widget.formKey?.currentState?.patchValue(
            {widget.name: selectedBoxOptions.map((e) => e.text).join(', ')});
      });

      if (widget.onChange != null) {
        widget.onChange!(_selectedItemsNotifier.value);
      }
    } else {
      widget.selectedOption = null;
      widget.formKey?.currentState?.patchValue({widget.name: ''});
      if (widget.onChange != null) {
        widget.onChange!([]);
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
            suffixIcon: widget.suffixIcon ??
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? AppColors.black.shade200
                            : AppColors.gray.shade100,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(
                      CupertinoIcons.chevron_down,
                      size: 18,
                    ),
                  ),
                ),
            isEnabled: widget.isEnabled,
            isRequired: widget.isRequired,
            onValidate: widget.onValidate,
            onSaved: widget.onSaved,
            onChange: widget.onSaved,
          ),
        ));
  }
}
