import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/resourses/components/custom_button.dart';
import 'package:mediapp/resourses/components/custom_textfield.dart';
import 'package:mediapp/views/home/home.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/strings.dart';
import '../../controllers/authcontroller.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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
                    AppStyles.bold(
                        title:
                            'Sign up now and start exploring all that our app has to offer.')
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
                  5.heightBox,
                  SwitchListTile(
                      title: 'Sign up as a doctor'.text.make(),
                      value: isDoctor,
                      onChanged: (newValue) {
                        setState(() {
                          isDoctor = newValue;
                        });
                      }),
                  Visibility(
                    visible: isDoctor,
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: 'About',
                          textControleer: controller.aboutController,
                        ),
                        5.heightBox,
                        CustomTextField(
                          hint: 'Category',
                          textControleer: controller.categoryController,
                        ),
                        5.heightBox,
                        CustomTextField(
                          hint: 'Services',
                          textControleer: controller.servicesController,
                        ),
                        5.heightBox,
                        CustomTextField(
                          hint: 'Address',
                          textControleer: controller.addressController,
                        ),
                        5.heightBox,
                        CustomTextField(
                          hint: 'Phone Number',
                          textControleer: controller.phoneController,
                        ),
                        5.heightBox,
                        CustomTextField(
                          hint: 'Timing',
                          textControleer: controller.timingController,
                        ),
                        5.heightBox,
                        AppStrings.forgetPassword.text.make(),
                      ],
                    ),
                  ),
                  10.heightBox,
                  CustomButton(
                    buttonText: AppStrings.signup,
                    onTap: () async {
                      await controller.signupUser(isDoctor);
                      if (controller.userCredential != null) {
                        Get.offAll(() => const Home());
                      }
                    },
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppStyles.normal(title: AppStrings.alreadyHaveAccount),
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
            )))
          ],
        ),
      ),
    );
  }
}
