import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/helper/router_helper.dart';
import 'package:numattendance/widgets/custom_bottom.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';

class DetailAttendanceWidget extends StatelessWidget {
  const DetailAttendanceWidget({
    this.backgroundColor,
    this.showSubject = true,
    this.showBtn = true,
    this.subject,
    this.studentName,
    this.isTodayScreen = false,
    this.buttonType,
    this.textBtn = "",
    super.key,
  });

  final String? subject;
  final Color? backgroundColor;
  final bool showSubject;
  final String? studentName;
  final bool isTodayScreen;
  final String? buttonType;
  final String textBtn;
  final bool showBtn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.paddingSizeDefault,
        bottom: 0,
        left: Dimensions.paddingSizeDefault,
        right: Dimensions.paddingSizeDefault,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: 2,
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showSubject
                    ? Container(
                        margin: EdgeInsets.only(
                          bottom: Dimensions.paddingSizeDefault,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.radiusLarge,
                            vertical: Dimensions.radiusDefault),
                        decoration: BoxDecoration(
                          color: TColor.primaryColor,
                          borderRadius: BorderRadius.circular(
                              Dimensions.radiusExtraLarge),
                        ),
                        child: Text(
                          subject!,
                          style: robotoBold.copyWith(
                            color: Colors.white,
                            fontSize: Dimensions.fontSizeDefault(context),
                          ),
                        ),
                      )
                    : Center(
                        child: Column(
                          children: [
                            Image.asset(
                              Images.attend2,
                              width: Get.width * 0.2,
                              color:
                                  !isTodayScreen ? Colors.black : Colors.white,
                            ),
                            Text(
                              "attendance information".toUpperCase(),
                              style: robotoBold.copyWith(
                                color: !isTodayScreen
                                    ? Colors.black
                                    : Colors.white,
                                fontSize:
                                    Dimensions.fontSizeExtraLarge(context),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.paddingSizeDefault,
                            ),
                          ],
                        ),
                      ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: isTodayScreen ? 6 : 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Student Name",
                                style: robotoRegular.copyWith(
                                  color: !isTodayScreen
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: Dimensions.fontSizeDefault(context),
                                ),
                              ),
                              Text(
                                "Phan Sonet".toUpperCase(),
                                style: robotoBold.copyWith(
                                  color: !isTodayScreen
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: Dimensions.fontSizeDefault(context),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeSmall,
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          showBtn
              ? CustomBottom(
                  buttonText: textBtn.toUpperCase(),
                  onPressed: () {
                    if (buttonType == null) {
                      return;
                    }
                    switch (buttonType!) {
                      case "today":
                        Get.toNamed(RouterHelper.getTodayAttendanceScreen());
                        break;
                      case "previous":
                        Get.toNamed(RouterHelper.getAttendPrevScreen());
                        break;
                    }
                  },
                  width: Get.width,
                  color: TColor.primaryColor,
                  radius: Dimensions.radiusExtraLarge - 2,
                  isRaduis: false,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
