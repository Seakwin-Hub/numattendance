import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/styles.dart';

class ClassSubjectWidget extends StatelessWidget {
  const ClassSubjectWidget(
      {super.key,
      this.absentPerson,
      this.latePerson,
      this.majorAndGen,
      this.subject,
      this.subjectDetail,
      this.totalStudent,
      this.isSubjectDetai = false,
      this.absentStuList,
      this.lateStuList,
      this.sex,
      this.studentId,
      this.displayTitle = true,
      this.studentName});
  final String? majorAndGen;
  final String? subject;
  final String? totalStudent;
  final String? absentPerson;
  final String? latePerson;
  final Function? subjectDetail;
  final bool isSubjectDetai;
  final String? studentId;
  final String? studentName;
  final String? sex;
  final String? absentStuList;
  final String? lateStuList;
  final bool displayTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => subjectDetail!(),
      child: Container(
        padding: !isSubjectDetai ? EdgeInsets.all(15) : EdgeInsets.zero,
        width: Get.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 239, 239),
          borderRadius: BorderRadius.circular(
            Dimensions.radiusDefault,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            !isSubjectDetai
                ? Text(
                    majorAndGen!,
                    style: robotoBold.copyWith(
                      color: Colors.black,
                      fontSize: Dimensions.fontSizeExtraLarge(context),
                    ),
                  )
                : SizedBox(),
            !isSubjectDetai
                ? Text(
                    subject!,
                    style: robotoRegular.copyWith(
                      color: Colors.black,
                      fontSize: Dimensions.fontSizeDefault(context),
                    ),
                  )
                : SizedBox(),
            !isSubjectDetai ? Divider() : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      if (displayTitle)
                        TextSpan(
                          text: !isSubjectDetai ? "Student\n" : "ID\n",
                          style: robotoRegular.copyWith(
                              color: Colors.black,
                              fontSize: !isSubjectDetai
                                  ? Dimensions.fontSizeLarge(context)
                                  : Dimensions.fontSizeDefault(context),
                              fontWeight: !isSubjectDetai
                                  ? FontWeight.w600
                                  : FontWeight.w100),
                        ),
                      TextSpan(
                        text: !isSubjectDetai ? totalStudent : studentId,
                        style: robotoBold.copyWith(
                          color: Colors.black,
                          fontSize: !isSubjectDetai
                              ? Dimensions.fontSizeLarge(context)
                              : Dimensions.fontSizeDefault(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      if (displayTitle)
                        TextSpan(
                          text: !isSubjectDetai ? "Absent\n" : "Student Name\n",
                          style: robotoBold.copyWith(
                              color: !isSubjectDetai
                                  ? TColor.absentColor
                                  : Colors.black,
                              fontSize: !isSubjectDetai
                                  ? Dimensions.fontSizeLarge(context)
                                  : Dimensions.fontSizeDefault(context),
                              fontWeight: !isSubjectDetai
                                  ? FontWeight.w600
                                  : FontWeight.w100),
                        ),
                      TextSpan(
                        text: !isSubjectDetai ? absentPerson : studentName,
                        style: robotoBold.copyWith(
                          color: !isSubjectDetai
                              ? TColor.absentColor
                              : Colors.black,
                          fontSize: !isSubjectDetai
                              ? Dimensions.fontSizeLarge(context)
                              : Dimensions.fontSizeDefault(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      if (displayTitle)
                        TextSpan(
                          text: !isSubjectDetai ? "Late\n" : "Sex\n",
                          style: robotoBold.copyWith(
                              color: !isSubjectDetai
                                  ? TColor.lateColore
                                  : Colors.black,
                              fontSize: !isSubjectDetai
                                  ? Dimensions.fontSizeLarge(context)
                                  : Dimensions.fontSizeDefault(context),
                              fontWeight: !isSubjectDetai
                                  ? FontWeight.w600
                                  : FontWeight.w100),
                        ),
                      TextSpan(
                        text: !isSubjectDetai ? latePerson : sex,
                        style: robotoBold.copyWith(
                          color: !isSubjectDetai
                              ? TColor.lateColore
                              : Colors.black,
                          fontSize: !isSubjectDetai
                              ? Dimensions.fontSizeLarge(context)
                              : Dimensions.fontSizeDefault(context),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSubjectDetai)
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        if (displayTitle)
                          TextSpan(
                            text: "Absent\n",
                            style: robotoBold.copyWith(
                                color: !isSubjectDetai
                                    ? TColor.lateColore
                                    : Colors.black,
                                fontSize: Dimensions.fontSizeDefault(context),
                                fontWeight: !isSubjectDetai
                                    ? FontWeight.w600
                                    : FontWeight.w100),
                          ),
                        TextSpan(
                          text: absentStuList,
                          style: robotoBold.copyWith(
                            color: TColor.absentColor,
                            fontSize: Dimensions.fontSizeDefault(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (isSubjectDetai)
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        if (displayTitle)
                          TextSpan(
                            text: "Late\n",
                            style: robotoBold.copyWith(
                                color: !isSubjectDetai
                                    ? TColor.lateColore
                                    : Colors.black,
                                fontSize: Dimensions.fontSizeDefault(context),
                                fontWeight: !isSubjectDetai
                                    ? FontWeight.w600
                                    : FontWeight.w100),
                          ),
                        TextSpan(
                          text: lateStuList,
                          style: robotoBold.copyWith(
                            color: TColor.lateColore,
                            fontSize: Dimensions.fontSizeDefault(context),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
