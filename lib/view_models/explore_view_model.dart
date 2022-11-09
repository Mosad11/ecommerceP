import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_p/models/categories_model.dart';
import 'package:ecommerce_p/models/product_model.dart';
import 'package:get/get.dart';

class ExploreViewmodel extends GetxController {
  List<CategoryModel> catList = [];
  List<ProductModel> proList = [];
  CollectionReference catRef =
      FirebaseFirestore.instance.collection('categories');
  CollectionReference proRef =
      FirebaseFirestore.instance.collection('products');
  @override
  void onInit() {
    getcategories();
    getProducts();
    super.onInit();
  }

  Future<void> getcategories() async {
    await catRef.orderBy('number', descending: false).get().then((value) {
      for (var i in value.docs) {
        catList.add(CategoryModel.fromMap(i));
      }
      update();
    });
  }

  Future<void> getProducts() async {
    await proRef.get().then((value) {
      for (var i in value.docs) {
        proList.add(ProductModel.fromMap(i));
      }
      update();
    });
  }
}
