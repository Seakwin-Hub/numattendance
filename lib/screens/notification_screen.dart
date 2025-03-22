import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red, // Color 1
      Colors.blue, // Color 2
      Colors.green, // Color 3
      Colors.orange, // Color 4
    ];
    return Scaffold(
        appBar: CustomAppBar(
          title: "Notification",
          context: context,
          isArrowIcon: true,
          onPressed: () => Get.back(),
          isLogoAppBar: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "CHILDREN NOTIFICATION",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final colorIndex = index % colors.length;
                    final backgroundColor = colors[colorIndex];
                    return Column(
                      children: [
                        NotificationWidget(
                          name: "Phan Sophanith",
                          description: "is absent on 29/02/2025",
                          color: backgroundColor,
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeDefault,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
