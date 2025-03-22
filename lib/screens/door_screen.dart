import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';

class DoorScreen extends StatefulWidget {
  const DoorScreen({super.key});

  @override
  State<DoorScreen> createState() => _DoorScreenState();
}

bool valueSwitch = false;

class _DoorScreenState extends State<DoorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Door Management",
        context: context,
        isArrowIcon: true,
        onPressed: () => Get.back(),
        isLogoAppBar: true,
      ),
      body: Column(
        children: [
          Image.asset(
            Images.imageDoor,
            height: Get.height / 2,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: Dimensions.paddingSizeSmall,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.paddingSizeExtraLarge),
              width: Get.width,
              decoration: BoxDecoration(
                color: TColor.primaryColor,
                borderRadius: BorderRadius.circular(
                    Dimensions.paddingSizeExtraLarge + 10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "door control function".toUpperCase(),
                    style: robotoBold.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSizeExtraLarge(context),
                    ),
                  ),
                  Image.asset(
                    Images.door,
                    color: Colors.white,
                  ),
                  Text(
                    "Please Click the Bottom Button",
                    style: robotoRegular.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSizeDefault(context),
                    ),
                  ),
                  Transform.scale(
                    scale: 1.2,
                    child: Switch.adaptive(
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.blue,
                        activeColor: Colors.greenAccent,
                        value: valueSwitch,
                        onChanged: (value) {
                          setState(() => valueSwitch = value);
                        }),
                  ),
                  Text(
                    "To Open The Door",
                    style: robotoRegular.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSizeDefault(context),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
