import 'package:flutter/material.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key,
      this.radius,
      this.onTapImage,
      this.userInfo,
      this.username,
      this.color,
      this.isHomePage = false,
      this.profileImage});
  final String? profileImage;
  final String? username;
  final String? userInfo;
  final double? radius;
  final bool isHomePage;
  final Color? color;
  final Function? onTapImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius!),
            bottomRight: Radius.circular(radius!),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isHomePage
              ? SizedBox()
              : InkWell(
                  onTap: () => onTapImage!(),
                  child: CircleAvatar(
                    maxRadius: Dimensions.radiusExtraLarge * 2.5,
                    minRadius: Dimensions.radiusExtraLarge * 2.5,
                    backgroundImage: AssetImage(profileImage!),
                  ),
                ),
          isHomePage
              ? SizedBox()
              : SizedBox(
                  width: Dimensions.paddingSizeExtremeLarge * 1.5,
                ),
          Text.rich(
            textAlign: isHomePage ? TextAlign.center : TextAlign.start,
            TextSpan(
              children: [
                TextSpan(
                  text: isHomePage ? "Hi  " : "",
                  style: robotoRegular.copyWith(
                      color: Colors.black,
                      fontSize: Dimensions.fontSizeDefault(context) + 1),
                ),
                TextSpan(
                  text: isHomePage
                      ? username!.split(" ").last.toUpperCase()
                      : username!.toUpperCase(),
                  style: robotoBold.copyWith(
                      color: isHomePage ? Colors.black : TColor.bg,
                      fontSize: Dimensions.fontSizeExtraLarge(context)),
                ),
                TextSpan(
                  text: "${userInfo!} \n",
                  style: robotoRegular.copyWith(
                      color: isHomePage ? Colors.black : TColor.bg,
                      fontSize: Dimensions.fontSizeDefault(context)),
                ),
                isHomePage
                    ? WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeDefault),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusLarge),
                            color: TColor.primaryColor,
                          ),
                          child: Text(
                            "2024-2025",
                            style: robotoBold.copyWith(
                              color: isHomePage ? Colors.white : TColor.bg,
                              fontSize: Dimensions.fontSizeSmall(context),
                            ),
                          ),
                        ),
                      )
                    : WidgetSpan(
                        child: Text(""),
                      ),
              ],
            ),
          ),
          isHomePage
              ? SizedBox(
                  width: Dimensions.paddingSizeExtremeLarge * 1.5,
                )
              : SizedBox(),
          isHomePage
              ? InkWell(
                  onTap: () => onTapImage!(),
                  child: CircleAvatar(
                    maxRadius: Dimensions.radiusExtraLarge * 2.5,
                    minRadius: Dimensions.radiusExtraLarge * 2.5,
                    backgroundImage: AssetImage(profileImage!),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
