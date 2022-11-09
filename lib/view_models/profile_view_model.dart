import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  CollectionReference userRef = FirebaseFirestore.instance.collection('user');
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String email = '';
  String name = '';

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  Future<void> getUserData() async {
    await userRef
        .where('id', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      name = value.docs[0]['name'];
      email = value.docs[0]['email'];
    });

    update();
  }
}
