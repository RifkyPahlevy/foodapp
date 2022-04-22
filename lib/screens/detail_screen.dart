// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controller/detail_screen_controller.dart';
import '../model/item_size.dart';
import '../theme.dart';
import '../widgets/list_size.dart';

class DetailScreen extends StatefulWidget {
  int id;
  String imageName;
  String priceDiskon;
  String price;
  String titleLine;
  String itemName;
  bool isPromo;
  String note;

  DetailScreen(
    this.id,
    this.imageName,
    this.priceDiskon,
    this.price,
    this.titleLine,
    this.itemName,
    this.isPromo,
    this.note,
  );

  @override
  State<DetailScreen> createState() => _DetailScreenState(
        id,
        imageName,
        priceDiskon,
        price,
        titleLine,
        itemName,
        isPromo,
        note,
      );
}

class _DetailScreenState extends State<DetailScreen> {
  // const DetailScreen({ Key? key }) : super(key: key);

  int id;
  String imageName;
  String priceDiskon;
  String price;
  String titleLine;
  String itemName;
  bool isPromo;
  String note;

  _DetailScreenState(
    this.id,
    this.imageName,
    this.priceDiskon,
    this.price,
    this.titleLine,
    this.itemName,
    this.isPromo,
    this.note,
  );

  DetailScreenController detaiC = DetailScreenController();

  @override
  Widget build(BuildContext context) {
    detaiC.isMiniPrees(int.parse(price), int.parse(priceDiskon));
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.network(
              imageName,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 244,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
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
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              itemName,
                              style: fontPoppins.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: blackColor),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  detaiC.minus(
                                      int.parse(price), int.parse(priceDiskon));
                                });
                              },
                              child: Container(
                                width: 33,
                                height: 33,
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: fontPoppins.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text("${detaiC.jumlah}",
                                style: fontPoppins.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor)),
                            const SizedBox(
                              width: 16,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  detaiC.plus(
                                      int.parse(price), int.parse(priceDiskon));
                                });
                              },
                              child: Container(
                                width: 33,
                                height: 33,
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: fontPoppins.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(detaiC.harga),
                              style: fontPoppins.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0)
                                  .format(detaiC.hargaPromo),
                              style: fontPoppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: yellowColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "Pilih Ukuran",
                          style: fontPoppins.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  detaiC.isMini = true;
                                  // detaiC.isMiniPrees();
                                });
                              },
                              child: ListSize(SizeItem(
                                id: 1,
                                sizeWidth: 48,
                                name: "Mini",
                                isChoice: detaiC.isMini,
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  detaiC.isSedang = true;
                                  detaiC.isSedangPrees(
                                      int.parse(price), int.parse(priceDiskon));
                                });
                              },
                              child: ListSize(SizeItem(
                                id: 2,
                                sizeWidth: 75,
                                name: "Sedang",
                                isChoice: detaiC.isSedang,
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  detaiC.isBesar = true;
                                  detaiC.isBesarPress(
                                      int.parse(price), int.parse(priceDiskon));
                                });
                              },
                              child: ListSize(SizeItem(
                                id: 3,
                                sizeWidth: 60,
                                name: "Besar",
                                isChoice: detaiC.isBesar,
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  detaiC.isSuperBesar = true;
                                  detaiC.isSuperBesarPress(
                                      int.parse(price), int.parse(priceDiskon));
                                });
                              },
                              child: ListSize(SizeItem(
                                id: 4,
                                sizeWidth: 104,
                                name: "Super Besar",
                                isChoice: detaiC.isSuperBesar,
                              )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "Catatan Penjual",
                          style: fontPoppins.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          note,
                          style: fontPoppins.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: greyDeepColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "Lokasi Burger Jawa",
                          style: fontPoppins.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: blackColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => detaiC.launchUrl(
                                  "https://goo.gl/maps/MLH8gNhFsiboGjWh6"),
                              child: Image.asset(
                                "assets/store.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "Jl. Veteran Duren Tiga",
                                    style: fontPoppins.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: greyDeepColor,
                                    ),
                                  ),
                                  Text(
                                    "Jakarta Selatan",
                                    style: fontPoppins.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: greyDeepColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: yellowColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              detaiC.launchUrl(
                                  "https://wa.me/6289689536181?text=Saya%20ingin%20membeli%20burger%20mini%20sebanyak%20${detaiC.jumlah}%20dengan%20harga%20Rp $priceDiskon");
                            },
                            child: Text(
                              "Beli",
                              style: fontPoppins.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 40,
                      child: const Icon(Icons.arrow_back_ios_outlined,
                          color: Colors.white),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      height: 30,
                      width: 40,
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
