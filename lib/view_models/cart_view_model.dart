import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_p/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import '../helpers/db.dart';

class CartViewModel extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<CartModel> cartProducts = [];
  DbHelper? dbHelper;
  int total = 0;
  @override
  void onInit() {
    dbHelper = DbHelper();
    dbHelper!.createDatabase();
    getAllToCart();
    super.onInit();
  }

  Future<void> addToCart(CartModel model) async {
    await dbHelper!.createProduct(model);
  }

  Future<void> getAllToCart() async {
    cartProducts.clear();
    dbHelper!.allProducts().then((value) {
      for (var i in value) {
        cartProducts.add(CartModel.fromMap(i));
      }
      calcTotal();
      update();
    });
  }

  void calcTotal() {
    total = 0;
    for (var i in cartProducts) {
      total = total + i.price * i.count;
    }
  }

  void delete(int id) {
    dbHelper!.delete(id);
    getAllToCart();
  }

  void increase(int index) {
    cartProducts[index].count++;
    dbHelper!.update(cartProducts[index]).then((value) {
      calcTotal();
      update();
    });
  }

  void decrease(int index) {
    if (cartProducts[index].count != 1) {
      cartProducts[index].count--;
      dbHelper!.update(cartProducts[index]).then((value) {
        calcTotal();
        update();
      });
    }
  }
}
