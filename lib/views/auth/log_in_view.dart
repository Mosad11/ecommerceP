import 'package:ecommerce_p/view_models/auth_view_model.dart';
import 'package:ecommerce_p/views/auth/sign_up_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class logInView extends GetWidget<AuthViewModel> {
  logInView({Key? key}) : super(key: key);
  final controller = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.125,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Log',
                            style: TextStyle(color: Colors.blue, fontSize: 35),
                          ),
                          Text(
                            'in',
                            style: TextStyle(color: Colors.black, fontSize: 35),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(SignUpView());
                        },
                        child: const Text("SignUP",
                            style: TextStyle(fontSize: 18, color: Colors.blue)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
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
                    controller: controller.passController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'password'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    children: const [Spacer(), Text("Forget Password?")],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.logIn();
                    },
                    child: const Text(
                      "LOG IN",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(Get.width * 311 / 375, Get.height * 50 / 812)),
                  )
                ],
              ),
            ),
            const Text("-OR-", style: TextStyle(fontSize: 18)),
            SizedBox(
              height: Get.height * 0.03,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: Get.height * 50 / 812,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/google.png"),
                    const Text("Sign In With Google"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
