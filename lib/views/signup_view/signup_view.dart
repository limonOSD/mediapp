import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/controllers/auth_controllers.dart';
import 'package:mediapp/resourses/components/custom_button.dart';
import 'package:mediapp/views/home/home.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/strings.dart';
import '../../resourses/components/custom_textfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.network(
              'https://static.vecteezy.com/system/resources/previews/027/395/212/non_2x/doctor-lady-friendly-smiling-arms-crossed-png.png',
              scale: 4,
            ),
          ),
          5.heightBox,
          AppStyles.bold(
              title:
                  'Sign up now and start exploring all that our app has to offer',
              size: AppSizes.size16),
          10.heightBox,
          Expanded(
            child: Form(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    hint: AppStrings.fullname,
                    textControleer: controller.fullnameController,
                  ),
                  5.heightBox,
                  CustomTextField(
                    hint: AppStrings.email,
                    textControleer: controller.emailController,
                  ),
                  5.heightBox,
                  CustomTextField(
                    hint: AppStrings.password,
                    textControleer: controller.passwordController,
                  ),
                  15.heightBox,
                  CustomButton(
                      buttonText: AppStrings.signup,
                      onTap: () async {
                        await controller.signupUser();
                        if (controller.userCredential != null) {
                          Get.offAll(() => const Home());
                        }
                      }),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppStrings.alreadyHaveAccount.text.make(),
                      5.widthBox,
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: AppStyles.bold(title: AppStrings.login),
                      )
                    ],
                  )
                ],
              ),
            )),
          ),
        ],
      ),
    ));
  }
}
