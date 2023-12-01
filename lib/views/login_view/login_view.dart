import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/strings.dart';
import 'package:mediapp/resourses/components/custom_button.dart';
import 'package:mediapp/resourses/components/custom_textfield.dart';
import 'package:mediapp/views/home/home.dart';
import 'package:mediapp/views/home/home_view.dart';
import 'package:mediapp/views/signup_view/signup_view.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      'https://static.vecteezy.com/system/resources/previews/027/395/212/non_2x/doctor-lady-friendly-smiling-arms-crossed-png.png',
                      scale: 4,
                    ),
                    5.heightBox,
                    AppStyles.bold(
                        title: AppStrings.welcomeBack, size: AppSizes.size18),
                    AppStyles.bold(title: AppStrings.weAreExcited)
                  ],
                ),
              ),
            )),
            5.heightBox,
            Expanded(
                child: Form(
                    child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    hint: AppStrings.email,
                  ),
                  5.heightBox,
                  CustomTextField(hint: AppStrings.password),
                  10.heightBox,
                  AppStrings.forgetPassword.text.make(),
                  10.heightBox,
                  CustomButton(
                    buttonText: AppStrings.login,
                    onTap: () {
                      Get.to(() => const Home());
                    },
                  ),
                  2.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppStrings.dontHaveAccount.text.make(),
                      5.widthBox,
                      TextButton(
                          onPressed: () {
                            Get.to(() => const SignupView());
                          },
                          child: AppStyles.bold(
                              title: 'Signup',
                              color: AppColors.blueColor,
                              size: AppSizes.size16))
                    ],
                  )
                ],
              ),
            )))
          ],
        ),
      ),
    );
  }
}
