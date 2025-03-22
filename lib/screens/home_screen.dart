import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/helper/router_helper.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/widgets/header_widget.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/app_constants.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';
import 'package:numattendance/models/user_model.dart';
import 'package:numattendance/widgets/custom_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.role});
  final String? role;

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel(
      username: "phan sophannet",
      majorId: "Robotic Engineering",
      admissionClass: "21 E",
      generation: "29/54",
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: "Homepage".toUpperCase(),
        context: context,
        role: role!,
        isSettingIcon: role!.contains("teacher") ? false : true,
        isLogoAppBar: role!.contains("teacher") ? true : false,
      ),
      body: Column(
        children: [
          HeaderWidget(
            onTapImage: () => Get.toNamed(RouterHelper.getProfileRoute()),
            profileImage:
                role!.contains("teacher") ? Images.tvichet : Images.phannet,
            isHomePage: role!.contains("teacher") ? false : true,
            color:
                role!.contains("teacher") ? TColor.primaryColor : Colors.white,
            userInfo: role!.contains("teacher")
                ? "\nSubject ${userModel.majorId}\nClass ${userModel.admissionClass} | Gen ${userModel.generation}"
                : "\nMajor ${userModel.majorId}\nClass ${userModel.admissionClass} | Gen ${userModel.generation}",
            username: userModel.username,
            radius: Dimensions.paddingSizeLarge * 2,
          ),
          SizedBox(
            height: role!.contains("teacher") ? 0 : Dimensions.paddingSizeLarge,
          ),
          role!.contains("teacher")
              ? SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i <= 1; i++)
                      CustomBox(
                        onPressed: () => {},
                        imageColor: Colors.black,
                        title: AppConstants.infoModel[i].title!,
                        value: AppConstants.infoModel[i].value!,
                        color: TColor.primaryColor,
                        radius: Dimensions.paddingSizeLarge,
                        paddingHorizontal:
                            Dimensions.fontSizeLarge(context) * 2,
                        paddingVertical: Dimensions.paddingSizeDefault,
                        styleText: robotoMedium.copyWith(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeExtraLarge(context),
                          fontWeight: FontWeight.w800,
                        ),
                        styleValue: robotoMedium.copyWith(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeDefault(context) + 3,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                  ],
                ),
          SizedBox(
            height: role!.contains("teacher") ? 0 : Dimensions.paddingSizeLarge,
          ),
          Expanded(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color:
                    role!.contains("teacher") ? TColor.bg : TColor.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Center(
                child: GridView.builder(
                  padding: EdgeInsets.all(25),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Get.width * 0.05,
                      mainAxisSpacing: Get.height * 0.03),
                  itemCount: role!.contains("teacher") ? 6 : 4,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    final getDoorRoute = AppConstants
                        .infoModel[index + 2].value!
                        .replaceAll(" ", "")
                        .toLowerCase();

                    return CustomBox(
                      onPressed: () {
                        switch (getDoorRoute) {
                          case "doormanage":
                            Get.toNamed(RouterHelper.getDoorScreen());
                            break;
                          case "attendance":
                            if (role!.contains("student")) {
                              Get.toNamed(
                                  RouterHelper.getStudentAttendanceRoute(
                                      "NUM01"));
                            } else {
                              Get.toNamed(RouterHelper.getTAttendanceScreen());
                            }
                            break;
                        }
                      },
                      isImageIcon: true,
                      imageIcon: AppConstants.infoModel[index + 2].title!,
                      title: '',
                      value: AppConstants.infoModel[index + 2].value!,
                      color: role!.contains("teacher")
                          ? TColor.primaryColor
                          : TColor.bg,
                      radius: Dimensions.paddingSizeLarge,
                      imageColor:
                          role!.contains("teacher") ? TColor.bg : Colors.black,
                      paddingHorizontal: Dimensions.paddingSizeSmall,
                      paddingVertical: Dimensions.paddingSizeLarge,
                      styleValue: robotoBold.copyWith(
                        color: role!.contains("teacher")
                            ? TColor.bg
                            : Colors.black,
                        fontSize: Dimensions.fontSizeDefault(context),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
