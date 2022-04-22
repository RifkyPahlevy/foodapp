import 'package:flutter/material.dart';
import 'package:foodsapp/model/item_size.dart';

import '../theme.dart';

class ListSize extends StatelessWidget {
  SizeItem itemSize;
  ListSize(this.itemSize);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: itemSize.sizeWidth,
      height: 31,
      child: Center(
        child: Text(
          itemSize.name,
          style: fontPoppins.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: blackColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: itemSize.isChoice != true ? Colors.white : greyWhiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
