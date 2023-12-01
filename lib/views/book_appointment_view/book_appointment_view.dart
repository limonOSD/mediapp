import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/resourses/components/custom_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/fonts.dart';
import '../../resourses/components/custom_button.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppStyles.bold(
            title: 'Doctor Name',
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: 'Select appointment day'),
              5.heightBox,
              const CustomTextField(hint: 'Select day'),
              10.heightBox,
              AppStyles.bold(title: 'Select appointment time'),
              5.heightBox,
              const CustomTextField(hint: 'Select time'),
              10.heightBox,
              AppStyles.bold(title: 'Mobile Number:'),
              5.heightBox,
              const CustomTextField(hint: 'Enter your mobile number'),
              10.heightBox,
              AppStyles.bold(title: 'Full Name:'),
              5.heightBox,
              const CustomTextField(hint: 'Enter your name'),
              10.heightBox,
              AppStyles.bold(title: 'Message:'),
              5.heightBox,
              const CustomTextField(hint: 'Enter your message'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(buttonText: 'Book an appoinment', onTap: () {}),
      ),
    );
  }
}
