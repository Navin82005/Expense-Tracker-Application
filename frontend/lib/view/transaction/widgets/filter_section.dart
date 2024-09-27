import 'package:flutter/material.dart';
import 'package:frontend/controller/transaction_filter_controller.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/widget/primary_button.dart';
import 'package:frontend/view/widget/secondary_button.dart';
import 'package:get/get.dart';

// Filter Dropdown button
class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<TransactionFilterController>(
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: GrayscaleWhiteColors.darkWhite,
                ),
              ),
              child: DropdownButton(
                elevation: 0,
                isExpanded: true,
                underline: const SizedBox.shrink(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                value: controller.currentFilter.value,
                dropdownColor: GrayscaleWhiteColors.white,
                items: Filters.values
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.name.capitalize!,
                          style: CustomTypography.subHead3,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (Filters? newValue) {
                  if (newValue != null) {
                    controller.changeFilter(newValue);
                  } else {
                    controller.changeFilter(controller.currentFilter.value);
                  }
                },
              ),
            ),
            const FilterValues(),
          ],
        );
      },
    );
  }
}

// ListView for displaying the days
class FilterValues extends StatelessWidget {
  const FilterValues({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GrayscaleWhiteColors.white,
      margin: const EdgeInsets.only(left: 16, bottom: 16, top: 8),
      height: 34,
      width: double.infinity,
      child: GetX<TransactionFilterController>(
        builder: (controller) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.selectedFilterValues.length,
            itemBuilder: (context, index) {
              if (controller.selectedFilterValues[index]["isSelected"]) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: PrimaryButton(
                    width: 57,
                    height: 34,
                    onPressed: () {
                      controller.changeSelectedFilterValues(index);
                    },
                    text: '',
                    child: Text(
                      controller.selectedFilterValues[index]["value"]
                          .toString()
                          .capitalize!,
                      style: CustomTypography.subHead3.copyWith(
                        color: GrayscaleWhiteColors.white,
                      ),
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SecondaryIconButton(
                  width: 57,
                  height: 34,
                  onTap: () {
                    controller.changeSelectedFilterValues(index);
                  },
                  icon: Text(
                    controller.selectedFilterValues[index]["value"]
                        .toString()
                        .capitalize!,
                    style: CustomTypography.subHead3.copyWith(
                      color: GrayscaleBlackColors.black,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
