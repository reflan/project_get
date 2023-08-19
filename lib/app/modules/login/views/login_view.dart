import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_get/app/routes/app_pages.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login View'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              TextField(
                controller: controller.cEmail,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextField(
                controller: controller.cPass,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                  child: Text("Reset Password"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => cAuth.login(
                  controller.cEmail.text,
                  controller.cPass.text,
                ),
                child: Text("Login"),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum Punya Akun ?"),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                    child: Text("Daftar Disini"),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
