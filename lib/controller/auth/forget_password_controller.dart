import 'package:flutter/material.dart';
import 'package:futsoul_merchant/repo/auth/forget_password_repo.dart';
import 'package:futsoul_merchant/utils/custom_snackbar.dart';
import 'package:futsoul_merchant/views/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class ForgetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  final emailController = TextEditingController();

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "PLease wiat ..");
      await ForgetPasswordRepo.forgetPassword(
        email: emailController.text,
        onSuccess: (message) {
          loading.hide();
          Get.offAll(WelcomeScreen.routeName, arguments: [emailController.text]);
          CustomSnackBar.success(title: "Forget Password", message: message);
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Forget Password", message: message);
        },
      );
    }
  }
}
