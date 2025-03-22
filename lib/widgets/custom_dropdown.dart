import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.title,
    this.validator,
    this.listDropdown,
    this.required = false,
    this.isOnChange,
    this.value,
  });
  final bool required;
  final String? title;
  final List<String>? listDropdown;
  final String? Function(String?)? validator;
  final Function(String)? isOnChange;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.red[900],
        ),
        contentPadding:
            EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 0.3,
              color: Theme.of(context).primaryColor),
        ),
      ),
      validator: validator,
      hint: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: title,
              style: robotoRegular.copyWith(
                fontSize: Dimensions.fontSizeDefault(context),
                color: Theme.of(context).hintColor.withValues(alpha: .75),
              ),
            ),
            if (required)
              TextSpan(
                  text: ' *',
                  style: robotoRegular.copyWith(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: Dimensions.fontSizeDefault(context))),
          ],
        ),
      ),
      items: listDropdown!
          .map(
            (String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: robotoRegular.copyWith(
                    fontSize: Dimensions.fontSizeLarge(context),
                    color: Theme.of(context).hintColor.withValues(alpha: .75)),
              ),
            ),
          )
          .toList(),
      onChanged: (value) => isOnChange!(value!),
      iconStyleData: IconStyleData(
        openMenuIcon: Icon(
          Icons.keyboard_arrow_up_rounded,
          size: Get.width * 0.05,
        ),
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: Get.width * 0.05,
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
        ),
      ),
    );
  }
}

String? selectedValue;
