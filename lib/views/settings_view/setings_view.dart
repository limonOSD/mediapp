import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/list.dart';
import 'package:mediapp/controllers/authcontroller.dart';
import 'package:mediapp/controllers/settings_controller.dart';
import 'package:mediapp/views/login_view/login_view.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppStyles.bold(
            title: 'Settings',
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      maxRadius: 50,
                      child: Image.network(
                        'https://freepngimg.com/download/man/22654-6-man.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: AppStyles.bold(title: controller.username.value),
                    subtitle: AppStyles.normal(title: controller.email.value),
                  ),
                  const Divider(),
                  20.heightBox,
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                        settingsList.length,
                        (index) => ListTile(
                            onTap: () async {
                              if (index == 2) {
                                AuthController().signout();
                                Get.offAll(() => const LoginView());
                              }
                            },
                            title: AppStyles.bold(title: settingsList[index]),
                            leading: Icon(
                              settingsListIcon[index],
                              color: AppColors.blueColor,
                            ))),
                  ),
                ],
              ),
      ),
    );
  }
}
