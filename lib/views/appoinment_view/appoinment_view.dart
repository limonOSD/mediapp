import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/controllers/appointment_controller.dart';
import 'package:mediapp/controllers/authcontroller.dart';
import 'package:mediapp/views/appoitment_details_view/appointment_details_view.dart';

import '../../consts/colors.dart';
import '../../consts/fonts.dart';

class AppoinmentView extends StatelessWidget {
  final bool isDoctor;
  const AppoinmentView({super.key, this.isDoctor = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: AppStyles.bold(
              title: 'Appointment',
              color: AppColors.whiteColor,
              size: AppSizes.size18),
          actions: [
            IconButton(
                onPressed: () {
                  AuthController().signout();
                },
                icon: const Icon(Icons.power_settings_new_outlined))
          ],
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: controller.getAppointments(isDoctor),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = snapshot.data?.docs;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Get.to(() => AppointmentDetailView(
                                  doc: data[index],
                                ));
                          },
                          leading: CircleAvatar(
                            child: Image.network(
                                'https://images.apollo247.in/doctors/8b6e24c7-2356-4134-8cda-d6e6ed8e063e.png'),
                          ),
                          title: AppStyles.bold(
                              title: data![index]
                                  [!isDoctor ? 'appWithName' : 'appName']),
                          subtitle: AppStyles.normal(
                              title:
                                  "${data[index]['appDay']}-${data[index]['appTime']}",
                              color: AppColors.textColor.withOpacity(0.5)),
                        );
                      }),
                );
              }
            }));
  }
}
