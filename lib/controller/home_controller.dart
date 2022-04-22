import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamAllProduct() async* {
    try {
      yield* firestore.collection("products").orderBy("id").snapshots();
    } catch (e) {
      print(e);
    }
  }
}
