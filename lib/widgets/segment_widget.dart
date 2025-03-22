import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';

class SegmentWidget extends StatefulWidget {
  final Function(String)? onChangeData;
  const SegmentWidget({super.key, this.onChangeData});

  @override
  State<SegmentWidget> createState() => _SegmentWidgetState();
}

class _SegmentWidgetState extends State<SegmentWidget> {
  String selectedTap = "Student";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Get.height * 0.1,
        top: Get.height * 0.01,
        bottom: Get.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Row(
        children: ['Student', 'Teacher', 'Parent']
            .map((tab) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTap = tab;
                      });
                      widget.onChangeData!(selectedTap);
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(
                        left: Get.width * 0.01,
                      ),
                      curve: Curves.easeInToLinear,
                      duration: const Duration(milliseconds: 150),
                      padding:
                          EdgeInsets.symmetric(vertical: Get.height * 0.01),
                      decoration: BoxDecoration(
                        color: selectedTap == tab
                            ? TColor.primaryColor
                            : Colors.transparent,
                        borderRadius: selectedTap == "Parent"
                            ? BorderRadius.only(
                                topLeft:
                                    Radius.circular(Dimensions.radiusDefault),
                                bottomLeft:
                                    Radius.circular(Dimensions.radiusDefault))
                            : BorderRadius.circular(Dimensions.radiusDefault),
                      ),
                      child: Center(
                        child: Text(
                          tab,
                          style: robotoMedium.copyWith(
                            color: selectedTap == tab
                                ? Colors.white
                                : Colors.grey[700],
                            fontWeight: selectedTap == tab
                                ? FontWeight.bold
                                : FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
