import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../core/common/colors/app_colors.dart';
import '../../../core/helper/localization/localization_helper.dart';


class SearchDropDownWidget extends StatelessWidget {
  const SearchDropDownWidget({
    super.key,
    this.selectedValue,
    required this.hintText,
    required this.items,
    this.onChanged,
    this.searchController,
    this.searchMatchFn,
    this.onMenuStateChange,
    this.isApiData = false,
  });
  final dynamic selectedValue;
  final String hintText;
  final List<dynamic> items;
  final void Function(dynamic)? onChanged;
  final TextEditingController? searchController;
  final bool Function(DropdownMenuItem<dynamic>, String)? searchMatchFn;
  final void Function(bool)? onMenuStateChange;
  final bool isApiData;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2<dynamic>(
      isExpanded: true,
      value: selectedValue,
      onChanged: onChanged,
      hint: Text(
        hintText,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).hintColor,
        ),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<dynamic>(
              value: item,
              child: Text(
                ' ${isApiData ? LocalizationHelper.translate(enText: item.nameEn ?? '', arText: item.nameAr ?? '') : item}',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 14,
                      color: AppColors().black,
                    ),
              ),
            ),
          )
          .toList(),
      dropdownSearchData: DropdownSearchData(
        searchController: searchController,
        searchInnerWidgetHeight: 65,
        searchInnerWidget: Container(
          height: 65,
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            expands: true,
            maxLines: null,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 14,
                  color: AppColors().black,
                ),
            controller: searchController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: 'Search...',
              hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 14,
                    color: AppColors().darkGrey,
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: searchMatchFn,
      ),
      onMenuStateChange: onMenuStateChange,
    ));
  }
}
