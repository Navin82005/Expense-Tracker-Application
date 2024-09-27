import 'package:flutter/material.dart';
import 'package:frontend/core/style/color.dart';
import 'package:frontend/view/widget/headers.dart';

PreferredSize TransactionHeader() {
  return PreferredSize(
    preferredSize: Size.copy(const Size(double.infinity, 68)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Header(title: 'Transaction Recap'),
            HeaderActions(
              icon1: Icon(
                Icons.filter_alt,
                size: 20,
                color: GrayscaleGrayColors.shadedGray,
              ),
              icon2: Icon(
                Icons.search,
                size: 20,
                color: GrayscaleGrayColors.shadedGray,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
