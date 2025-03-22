import 'package:flutter/material.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.description,
    required this.name,
    required this.color,
  });
  final String name;
  final String description;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(
            Icons.add_alert_outlined,
            size: 32,
            color: Colors.white,
          ),
          SizedBox(
            width: 7,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "$name  ",
                  style: robotoBold.copyWith(
                    color: Colors.white,
                    fontSize: Dimensions.paddingSizeDefault,
                  ),
                ),
                TextSpan(
                  text: description,
                  style: robotoMedium.copyWith(
                    color: Colors.white,
                    fontSize: Dimensions.paddingSizeDefault - 1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
