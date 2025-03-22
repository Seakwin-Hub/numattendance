import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/widgets/custom_bottom.dart';
import 'package:numattendance/widgets/header_widget.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';
import 'package:numattendance/widgets/class_widget_subject.dart';
import 'package:numattendance/models/user_model.dart';

class AttendencDetailScreen extends StatelessWidget {
  const AttendencDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel(
      username: "phan sophannet",
      majorId: "Robotic Engineering",
      admissionClass: "21 E",
      generation: "29/54",
    );
    return Scaffold(
      backgroundColor: TColor.primaryColor,
      appBar: CustomAppBar(
        title: "Attenedance",
        context: context,
        isArrowIcon: true,
        onPressed: () => Get.back(),
        isLogoAppBar: true,
      ),
      body: Column(
        children: [
          HeaderWidget(
            profileImage: Images.tvichet,
            color: TColor.primaryColor,
            userInfo:
                "\nMajor ${userModel.majorId}\nClass ${userModel.admissionClass} | Gen ${userModel.generation}",
            username: userModel.username,
            radius: Dimensions.paddingSizeLarge * 2,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Color.fromARGB(255, 240, 239, 239),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Class it 29/54".toUpperCase(),
                      style: robotoBold.copyWith(
                        color: Colors.black,
                        fontSize: Dimensions.paddingSizeLarge,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                          ClassSubjectWidget(
                            majorAndGen: "IT 30/54",
                            subject: "Java Programming",
                            totalStudent: "10",
                            absentPerson: "15%",
                            latePerson: "10%",
                            sex: "",
                            studentId: "",
                            studentName: "",
                            absentStuList: "",
                            lateStuList: "",
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                          Text(
                            "Student List",
                            style: robotoBold.copyWith(
                              color: Colors.black,
                              fontSize: Dimensions.paddingSizeLarge,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 240, 239, 239),
                              borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault,
                              ),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return ClassSubjectWidget(
                                  isSubjectDetai: true,
                                  displayTitle: index > 0 ? false : true,
                                  sex: index == 0 ? "   M" : "M",
                                  studentId: "1",
                                  studentName: index == 0
                                      ? " Thul Sokunraksmey"
                                      : "Thul Sokunraksmey",
                                  absentStuList: "10%",
                                  lateStuList: "15%",
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                          Text(
                            "Sit Arrangement",
                            style: robotoBold.copyWith(
                              color: Colors.black,
                              fontSize: Dimensions.paddingSizeLarge,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 240, 239, 239),
                              borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GridView.builder(
                                  padding: EdgeInsets.all(25),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: Get.width * 0.05,
                                          mainAxisSpacing: Get.height * 0.03),
                                  itemCount: 9,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Icon(
                                      Icons.person,
                                      size: 48,
                                      color: Colors.red,
                                    );
                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomBottom(
                                      buttonText: "Present",
                                      onPressed: () => {},
                                      width: Get.width * 0.25,
                                      height: Get.height * 0.05,
                                      color: TColor.absentColor,
                                      radius: 24,
                                    ),
                                    CustomBottom(
                                      buttonText: "Absent",
                                      onPressed: () => {},
                                      width: Get.width * 0.25,
                                      height: Get.height * 0.05,
                                      color: Colors.green[800],
                                      radius: 24,
                                    ),
                                    CustomBottom(
                                      buttonText: "Late",
                                      onPressed: () => {},
                                      width: Get.width * 0.25,
                                      height: Get.height * 0.05,
                                      color: TColor.presentColor,
                                      radius: 24,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
