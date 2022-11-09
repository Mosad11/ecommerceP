import 'package:ecommerce_p/view_models/auth_view_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({Key? key}) : super(key: key);
  final controller = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.07,
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Sign',
                        style: TextStyle(color: Colors.blue, fontSize: 35),
                      ),
                      Text(
                        'Up',
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  const Text(
                    "User Name",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(hintText: 'name'),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration:
                        const InputDecoration(hintText: 'example@mail.com'),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.passController,
                    decoration: const InputDecoration(hintText: 'password'),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.signUp();
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(Get.width * 311 / 375, Get.height * 50 / 812)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
