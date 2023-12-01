import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/fonts.dart';
import '../../resourses/components/custom_textfield.dart';

class AppointmentDetailView extends StatelessWidget {
  const AppointmentDetailView({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyles.bold(title: 'Select appointment day'),
            5.heightBox,
            AppStyles.normal(title: 'Selected Day'),
            10.heightBox,
            AppStyles.bold(title: 'Select appointment time'),
            5.heightBox,
            AppStyles.normal(title: 'Selected time'),
            10.heightBox,
            AppStyles.bold(title: 'Mobile Number:'),
            5.heightBox,
            AppStyles.normal(title: 'Mobile Number'),
            10.heightBox,
            AppStyles.bold(title: 'Full Name:'),
            5.heightBox,
            AppStyles.normal(title: 'Name'),
            10.heightBox,
            AppStyles.bold(title: 'Message:'),
            5.heightBox,
            AppStyles.normal(title: 'Message'),
          ],
        ),
      ),
    );
  }
}
