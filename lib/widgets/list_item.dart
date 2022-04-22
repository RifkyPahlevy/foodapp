import 'package:flutter/material.dart';
import 'package:foodsapp/model/item.dart';

import '../theme.dart';

class ListItem extends StatelessWidget {
  DataMenu menu;
  ListItem(this.menu);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 110,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      menu.imageName,
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                menu.isPromo != true
                    ? Container(
                        height: 15,
                        width: 45,
                        child: Center(
                            child: Text(
                          "Terlaris",
                          style: fontPoppins.copyWith(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.purple[900],
                            borderRadius: BorderRadius.circular(8)),
                      )
                    : Container(
                        height: 15,
                        width: 45,
                        child: Center(
                            child: Text(
                          "Promo",
                          style: fontPoppins.copyWith(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                Text(
                  menu.itemName,
                  style: fontPoppins.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: blackColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Rp ${menu.price}",
                      style: fontPoppins.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: greyColor,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      "Rp ${menu.priceDiskon}",
                      style: fontPoppins.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: yellowColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  menu.titleLine,
                  style: fontPoppins.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: greyColor,
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
