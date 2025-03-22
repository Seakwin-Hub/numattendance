import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  const CustomBox(
      {super.key,
      required this.title,
      required this.value,
      this.color,
      this.paddingHorizontal,
      this.paddingVertical,
      this.radius,
      this.imageIcon,
      this.styleText,
      this.isImageIcon = false,
      this.imageColor,
      this.onPressed,
      this.styleValue});
  final String title;
  final String value;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final Color? color;
  final double? radius;
  final TextStyle? styleText;
  final TextStyle? styleValue;
  final String? imageIcon;
  final bool isImageIcon;
  final Color? imageColor;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal!, vertical: paddingVertical!),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: InkWell(
        onTap: () => onPressed!(),
        child: Column(
          children: [
            isImageIcon
                ? Image.asset(
                    imageIcon!,
                    width: 50,
                    height: 50,
                    color: imageColor,
                  )
                : Text(
                    title,
                    style: styleText,
                  ),
            SizedBox(
              height: 18,
            ),
            Text(
              value,
              style: styleValue,
            ),
          ],
        ),
      ),
    );
  }
}
