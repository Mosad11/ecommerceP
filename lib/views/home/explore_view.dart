import 'package:ecommerce_p/view_models/explore_view_model.dart';
import 'package:ecommerce_p/views/home/details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreView extends GetWidget<ExploreViewmodel> {
  ExploreView({Key? key}) : super(key: key);
  final controller = Get.put(ExploreViewmodel());
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GetBuilder<ExploreViewmodel>(
        builder: (cont) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Get.height * 95 / 812,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.catList.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Center(
                                  child: Image.network(
                                      controller.catList[index].image),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(controller.catList[index].name)
                          ],
                        ),
                      );
                    })),
              ),
              SizedBox(height: Get.height * 0.03),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Latest  Items',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: SizedBox(
                    height: Get.height * 319 / 812,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.proList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (() {
                                    Get.to(DetailsView(
                                        model: controller.proList[index]));
                                  }),
                                  child: Image.network(
                                      controller.proList[index].image,
                                      fit: BoxFit.fill,
                                      height: Get.height * 240 / 812,
                                      width: Get.width * 164 / 375),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.proList[index].name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      controller.proList[index].brand,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Text(
                                      '\$${controller.proList[index].price}',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.blue),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        })),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
