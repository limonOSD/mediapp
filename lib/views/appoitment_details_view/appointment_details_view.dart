import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/fonts.dart';

class AppointmentDetailView extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetailView({
    super.key,
    required this.doc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppStyles.bold(
            title: doc['appWithName'],
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
            AppStyles.normal(title: doc['appDay']),
            10.heightBox,
            AppStyles.bold(title: 'Select appointment time'),
            5.heightBox,
            AppStyles.normal(title: doc['appTime']),
            10.heightBox,
            AppStyles.bold(title: 'Mobile Number:'),
            5.heightBox,
            AppStyles.normal(title: doc['appMobile']),
            10.heightBox,
            AppStyles.bold(title: 'Full Name:'),
            5.heightBox,
            AppStyles.normal(title: doc['appName']),
            10.heightBox,
            AppStyles.bold(title: 'Message:'),
            5.heightBox,
            AppStyles.normal(title: doc['appMsg']),
          ],
        ),
      ),
    );
  }
}
