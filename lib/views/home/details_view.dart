import 'package:ecommerce_p/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';
import '../../view_models/cart_view_model.dart';

class DetailsView extends StatelessWidget {
  DetailsView({Key? key, required this.model}) : super(key: key);
  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 196 / 812,
              child: Stack(children: [
                Container(
                  width: Get.width,
                  height: Get.height * 196 / 812,
                  child: Image.network(model.image),
                ),
                Positioned(
                    left: 0,
                    top: Get.height * 98 / 812,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ))),
                Positioned(
                    right: 0,
                    top: Get.height * 90 / 812,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.star,
                          )),
                    ))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('''${model.details}'''),
            ),
            const Spacer(),
            Container(
              height: Get.height * 84 / 812,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.grey)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("PRICE "),
                      Text(
                        "\$${model.price}",
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final cont = Get.put(CartViewModel());
                      final CartModel cartmodel = CartModel(
                          name: model.name,
                          image: model.image,
                          price: model.price,
                          count: 1);
                      await cont.addToCart(cartmodel);
                      cont.getAllToCart();
                    },
                    child: const Text("ADD",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(Get.width * 146 / 375, Get.height * 50 / 812)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
