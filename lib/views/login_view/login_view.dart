import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/strings.dart';
import 'package:mediapp/controllers/authcontroller.dart';
import 'package:mediapp/resourses/components/custom_button.dart';
import 'package:mediapp/resourses/components/custom_textfield.dart';
import 'package:mediapp/views/appoinment_view/appoinment_view.dart';
import 'package:mediapp/views/home/home.dart';
import 'package:mediapp/views/signup_view/signup_view.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

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
                    textControleer: controller.emailController,
                  ),
                  10.heightBox,
                  CustomTextField(
                    hint: AppStrings.password,
                    textControleer: controller.passwordController,
                  ),
                  20.heightBox,
                  AppStrings.forgetPassword.text.make(),
                  10.heightBox,
                  SwitchListTile(
                    value: isDoctor,
                    onChanged: (newValue) {
                      setState(() {
                        isDoctor = newValue;
                      });
                    },
                    title: 'Sign in as a doctor'.text.make(),
                  ),
                  20.heightBox,
                  CustomButton(
                    buttonText: AppStrings.login,
                    onTap: () async {
                      await controller.loginUser();
                      if (controller.userCredential != null) {
                        if (isDoctor) {
                          //signing as a doctor
                          Get.to(() => const AppoinmentView());
                        } else {
                          //signing as a user
                          Get.to(() => const Home());
                        }
                      }
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
