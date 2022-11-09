import 'package:ecommerce_p/view_models/profile_view_model.dart';
import 'package:ecommerce_p/views/auth/log_in_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetWidget<ProfileViewModel> {
  ProfileView({Key? key}) : super(key: key);
  final controller = Get.put(ProfileViewModel());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        builder: (_) => SafeArea(
              child: Scaffold(
                body: SizedBox(
                  height: Get.height,
                  width: Get.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: Get.width * 120 / 375,
                                width: Get.width * 120 / 375,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.withOpacity(0.3)),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                  size: 50,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.email,
                                    style: const TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.firebaseAuth.signOut().then((value) {
                              Get.offAll(() => logInView());
                            });
                          },
                          child: ListTile(
                            title: const Text("Logout"),
                            leading: Image.asset("assets/logout.png"),
                            trailing: const RotatedBox(
                                quarterTurns: 2,
                                child: Icon(Icons.arrow_back_ios)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
