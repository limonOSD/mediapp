import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/views/appoitment_details_view/appointment_details_view.dart';

import '../../consts/colors.dart';
import '../../consts/fonts.dart';

class AppoinmentView extends StatelessWidget {
  const AppoinmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppStyles.bold(
            title: 'Appointment',
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Get.to(() => const AppointmentDetailView());
                },
                leading: CircleAvatar(
                  child: Image.network(
                      'https://images.apollo247.in/doctors/8b6e24c7-2356-4134-8cda-d6e6ed8e063e.png'),
                ),
                title: AppStyles.bold(title: 'Doctor Name'),
                subtitle: AppStyles.normal(
                    title: 'Appointment time',
                    color: AppColors.textColor.withOpacity(0.5)),
              );
            }),
      ),
    );
  }
}
