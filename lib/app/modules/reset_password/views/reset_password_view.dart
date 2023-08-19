import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final cEmail = TextEditingController();
  final cPass = TextEditingController();
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetPasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ResetPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
