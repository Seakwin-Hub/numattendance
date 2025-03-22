import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/helper/router_helper.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function? onPressed;
  final Function? logout;
  final BuildContext? context;
  final String? role;
  final bool isLogoAppBar;
  final bool isSettingIcon;
  final bool isNotificationIcon;
  final bool isAlertIcon;
  final double? logoSize;
  final bool isArrowIcon;
  final String? title;
  final bool isLogout;
  const CustomAppBar({
    super.key,
    this.logout,
    this.isNotificationIcon = false,
    this.isAlertIcon = false,
    this.isSettingIcon = false,
    this.isLogoAppBar = false,
    this.isArrowIcon = false,
    this.logoSize,
    this.isLogout = false,
    this.title,
    this.onPressed,
    this.role,
    this.context,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title!,
        style: robotoBold.copyWith(
          color: Colors.white,
          fontSize: Dimensions.paddingSizeLarge,
        ),
      ),
      leading: isArrowIcon
          ? IconButton(
              onPressed: () => onPressed!(),
              icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            )
          : role == "student"
              ? Padding(
                  padding:
                      EdgeInsets.only(left: Dimensions.paddingSizeDefault + 10),
                  child: Image.asset(
                    Images.logo,
                  ),
                )
              : SizedBox(),
      backgroundColor: TColor.primaryColor,
      actions: [
        isLogoAppBar
            ? Padding(
                padding: EdgeInsets.only(
                    right: isNotificationIcon
                        ? Dimensions.paddingSizeExtraSmall
                        : Dimensions.paddingSizeDefault),
                child: Image.asset(
                  Images.logo,
                  width: Get.width * 0.09,
                ),
              )
            : isAlertIcon
                ? Padding(
                    padding:
                        EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                    child: Icon(
                      Icons.report_gmailerrorred,
                      color: Colors.white,
                      size: Get.width * 0.09,
                    ),
                  )
                : isSettingIcon
                    ? Padding(
                        padding: EdgeInsets.only(
                            right: Dimensions.paddingSizeDefault),
                        child: IconButton(
                          onPressed: () =>
                              Get.toNamed(RouterHelper.getProfileRoute()),
                          icon: Icon(Icons.settings),
                          color: Colors.white,
                          iconSize: Get.width * 0.08,
                        ),
                      )
                    : SizedBox(),
        if (isLogout)
          IconButton(
            onPressed: () => logout!(),
            icon: Icon(
              Icons.logout_rounded,
            ),
            color: Colors.white,
            iconSize: Get.width * 0.07,
          ),
        isNotificationIcon
            ? Padding(
                padding: EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                child: IconButton(
                  onPressed: () => onPressed!(),
                  icon: Icon(
                    Icons.notification_add_rounded,
                  ),
                  color: Colors.white,
                  iconSize: Get.width * 0.07,
                ),
              )
            : SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => Size(Get.width, GetPlatform.isDesktop ? 100 : 50);
}
