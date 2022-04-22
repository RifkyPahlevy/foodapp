import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodsapp/controller/home_controller.dart';
import 'package:foodsapp/model/item.dart';
import 'package:foodsapp/screens/detail_screen.dart';
import 'package:foodsapp/theme.dart';
import 'package:foodsapp/widgets/list_item.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  HomeController homeC = HomeController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              "Hello, Pahlevy",
              style: fontPoppins.copyWith(
                  fontSize: 24, fontWeight: FontWeight.w500, color: blackColor),
            ),
            Text(
              "Selamat datang di burger jaksel",
              style: fontPoppins.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w400, color: greyColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Recomended Menu",
              style: fontPoppins.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w400, color: blackColor),
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: homeC.streamAllProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("Data Kosong"),
                    );
                  }

                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> product =
                            snapshot.data!.docs[index].data();

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    product["id"],
                                    product["image"],
                                    product["pricepromo"],
                                    product["price"],
                                    product["title"],
                                    product["nameproduct"],
                                    true,
                                    product["note"],
                                  ),
                                ));
                          },
                          child: ListItem(DataMenu(
                            id: product["id"],
                            imageName: product["image"],
                            priceDiskon: product["pricepromo"],
                            price: product["price"],
                            titleLine: product["title"],
                            itemName: product["nameproduct"],
                            isPromo: true,
                            note: "dddd",
                          )),
                        );
                      });
                })
          ],
        ),
      ),
    );
  }
}
