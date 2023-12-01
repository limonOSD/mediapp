import 'package:flutter/material.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/list.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppStyles.bold(
            title: 'Settings',
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              maxRadius: 50,
              child: Image.network(
                'https://freepngimg.com/download/man/22654-6-man.png',
                fit: BoxFit.contain,
              ),
            ),
            title: AppStyles.bold(title: 'Username'),
            subtitle: AppStyles.normal(title: 'user_emil@gmail.com'),
          ),
          const Divider(),
          20.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
                settingsList.length,
                (index) => ListTile(
                    onTap: () {},
                    title: AppStyles.bold(title: settingsList[index]),
                    leading: Icon(
                      settingsListIcon[index],
                      color: AppColors.blueColor,
                    ))),
          ),
        ],
      ),
    );
  }
}
