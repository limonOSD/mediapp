import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/controllers/appointment_controller.dart';
import 'package:mediapp/resourses/components/custom_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/fonts.dart';
import '../../resourses/components/custom_button.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;
  const BookAppointmentView(
      {super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppStyles.bold(
            title: docName, color: AppColors.whiteColor, size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: 'Select appointment day'),
              5.heightBox,
              CustomTextField(
                hint: 'Select day',
                textControleer: controller.appDayController,
              ),
              10.heightBox,
              AppStyles.bold(title: 'Select appointment time'),
              5.heightBox,
              CustomTextField(
                hint: 'Select time',
                textControleer: controller.appTimeController,
              ),
              10.heightBox,
              AppStyles.bold(title: 'Mobile Number:'),
              5.heightBox,
              CustomTextField(
                hint: 'Enter your mobile number',
                textControleer: controller.appMobileController,
              ),
              10.heightBox,
              AppStyles.bold(title: 'Full Name:'),
              5.heightBox,
              CustomTextField(
                hint: 'Enter your name',
                textControleer: controller.appNameController,
              ),
              10.heightBox,
              AppStyles.bold(title: 'Message:'),
              5.heightBox,
              CustomTextField(
                hint: 'Enter your message',
                textControleer: controller.appMessageController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  buttonText: 'Book an appoinment',
                  onTap: () async {
                    await controller.bookAppointment(docId, docName, context);
                  }),
        ),
      ),
    );
  }
}
