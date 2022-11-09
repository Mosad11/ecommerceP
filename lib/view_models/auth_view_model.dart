import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../views/home/home_view.dart';

class AuthViewModel extends GetxController {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passController;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection('user');
  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  Future<void> signUp() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController!.text, password: passController!.text)
        .then((value) {
      if (value != null) {
        userModel user = userModel(
            id: value.user!.uid,
            name: nameController!.text,
            password: passController!.text,
            email: emailController!.text);
        userRef.doc(value.user!.uid).set(user.toMap()).then((value) {
          Get.snackbar('Success', "Signed Up");
        });
      }
    }).catchError((e) {
      Get.snackbar("error", e.toString(),
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> logIn() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController!.text, password: passController!.text)
        .then((value) {
      if (value != null) {
        Get.snackbar("Sucess", "Login Sucessfully");
        Get.off(HomeView());
      }
    }).catchError((e) {
      Get.snackbar("error", e.toString(),
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    });
  }
}
