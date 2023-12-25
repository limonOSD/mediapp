import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/consts/list.dart';
import 'package:mediapp/consts/strings.dart';
import 'package:mediapp/views/catagory_details_view/catagory_details_view.dart';
import 'package:velocity_x/velocity_x.dart';

class CatagoryView extends StatelessWidget {
  const CatagoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: AppStyles.bold(
              title: AppStrings.catagory,
              size: AppSizes.size18,
              color: AppColors.whiteColor),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisExtent: 180,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2),
              itemCount: iconList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => CatagoryDetailsView(
                          catName: iconTitleList[index],
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.blueColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            iconList[index],
                            width: 60,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        30.heightBox,
                        AppStyles.bold(
                            title: iconTitleList[index],
                            color: AppColors.whiteColor,
                            size: AppSizes.size16),
                        10.heightBox,
                        AppStyles.normal(
                            title: '13 specialists',
                            color: AppColors.whiteColor.withOpacity(0.5),
                            size: AppSizes.size16),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
