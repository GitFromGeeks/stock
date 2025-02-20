import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stocks/core/helpers/extensions/context_extensions.dart';

import '../../helpers/constants/app_colors.dart' show AppColors;

class CustomDropdown extends ConsumerWidget {
  final String placeHolder;
  final dynamic selected;
  final List availableOptions;
  final num? width;

  final Function(Object?)? onChange;
  const CustomDropdown({
    super.key,
    required this.placeHolder,
    required this.selected,
    required this.availableOptions,
    required this.onChange,
    this.width,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allOptions = ["All", ...availableOptions];
    return Container(
      width: context.screenWidth * (width ?? 0.9),
      height: context.screenHeight * 0.05,
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textGreyColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          iconEnabledColor: AppColors.textGreyColor,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          borderRadius: BorderRadius.circular(10.0),
          items:
              allOptions.map((option) {
                return DropdownMenuItem(
                  value: option,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: context.screenWidth * (width ?? 0.45),
                    child: DropdownItem(item: option),
                  ),
                );
              }).toList(),
          hint: SizedBox(
            width: context.screenWidth * 0.65,
            child: Text(
              (selected != null) ? selected.toString() : "Selected",
              overflow: TextOverflow.ellipsis,
              style: context.lm,
            ),
          ),
          onChanged: onChange,
        ),
      ),
    );
  }
}

class DropdownItem extends ConsumerWidget {
  final String item;
  const DropdownItem({super.key, required this.item});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(item, overflow: TextOverflow.ellipsis, style: context.lm);
  }
}
