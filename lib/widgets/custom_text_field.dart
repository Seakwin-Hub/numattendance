import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool showLabelText;
  final bool required;
  final String hintText;
  final bool isOnTap;
  final DateTime? dateTime;
  final bool isSelectDate;
  final TextInputAction inputAction;
  final Function(DateTime date)? onIOSDateChanged;
  final Function(DateTime date)? onAndroidDateChanged;
  final TextInputType inputType;
  final bool isPassword;
  final double? labelTextSize;
  final Widget? suffixChild;
  final bool isDropdown;
  final bool isDatePick;
  final int maxLine;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final FocusNode? nextFocus;
  final Function? onChanged;
  final Function? onSubmit;
  final TextCapitalization capitalization;
  final bool isShowCursor;
  final Widget? selectDate;
  final bool isReadOnly;

  const CustomTextField({
    super.key,
    this.maxLine = 1,
    this.isReadOnly = false,
    this.validator,
    this.labelText,
    this.dateTime,
    this.selectDate,
    this.capitalization = TextCapitalization.none,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.labelTextSize,
    this.hintText = '',
    this.nextFocus,
    this.onSubmit,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.isOnTap = false,
    this.isShowCursor = true,
    this.isSelectDate = false,
    this.isDatePick = false,
    this.isDropdown = false,
    this.isEnabled = true,
    this.required = false,
    this.showLabelText = true,
    this.isPassword = false,
    this.suffixChild,
    this.onIOSDateChanged,
    this.onAndroidDateChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          enabled: widget.isEnabled,
          maxLines: widget.maxLine,
          controller: widget.controller,
          textCapitalization: widget.capitalization,
          focusNode: widget.focusNode,
          obscureText: widget.isPassword ? _obscureText : false,
          autofocus: false,
          showCursor: widget.isShowCursor,
          validator: widget.validator,
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          style: robotoRegular.copyWith(
              fontSize: Dimensions.fontSizeLarge(context)),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 0.3,
                  color: Theme.of(context).primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Theme.of(context).primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(
                style: BorderStyle.none,
                width: 0.3,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Theme.of(context).colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Theme.of(context).colorScheme.error),
            ),
            hintText: widget.hintText,
            floatingLabelBehavior: widget.isSelectDate
                ? FloatingLabelBehavior.never
                : FloatingLabelBehavior.auto,
            hintStyle: robotoRegular.copyWith(
                fontSize: Dimensions.fontSizeLarge(context),
                color: Theme.of(context).hintColor),
            label: widget.showLabelText
                ? Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: widget.labelText ?? '',
                            style: robotoRegular.copyWith(
                                fontSize: widget.labelTextSize ??
                                    Dimensions.fontSizeLarge(context),
                                color: Theme.of(context)
                                    .hintColor
                                    .withValues(alpha: .75))),
                        if (widget.required && widget.labelText != null)
                          TextSpan(
                              text: ' *',
                              style: robotoRegular.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                  fontSize: Dimensions.fontSizeLarge(context))),
                      ],
                    ),
                  )
                : null,
            labelStyle: widget.showLabelText
                ? robotoRegular.copyWith(
                    fontSize: Dimensions.fontSizeDefault(context),
                    color: Theme.of(context).hintColor)
                : null,
            isDense: true,
            filled: true,
            fillColor: TColor.bg,
            errorStyle: robotoRegular.copyWith(
              fontSize: Dimensions.fontSizeSmall(context),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color:
                            Theme.of(context).hintColor.withValues(alpha: 0.3)),
                    onPressed: _toggle,
                  )
                : widget.isSelectDate
                    ? Icon(
                        Icons.date_range,
                        color:
                            Theme.of(context).hintColor.withValues(alpha: 0.3),
                      )
                    : widget.suffixChild,
          ),
          onFieldSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
                  ? widget.onSubmit!(text)
                  : null,
          onChanged: widget.onChanged as void Function(String)?,
          onTap: () => widget.isOnTap
              ? {
                  if (Platform.isIOS)
                    _showIOSDatePick(context)
                  else
                    _showAndroidDatePick(context)
                }
              : '',
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _showAndroidDatePick(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              width: Get.width,
              height: Get.height * 0.45,
              child: Column(
                children: [
                  CalendarDatePicker(
                    onDateChanged: (date) => widget.onAndroidDateChanged!(date),
                    initialDate: widget.dateTime,
                    firstDate: DateTime(1925),
                    lastDate: DateTime.now().add(
                      Duration(days: 362 * 2),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showIOSDatePick(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: Get.height * 0.4,
            decoration: BoxDecoration(
              color: TColor.bg,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.paddingSizeExtremeLarge),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Done",
                      style: robotoMedium.copyWith(
                        fontSize: Dimensions.fontSizeLarge(context),
                      )),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    minimumDate: DateTime(1925),
                    maximumDate: DateTime.now().add(
                      Duration(days: 2 * 365),
                    ),
                    initialDateTime: widget.dateTime,
                    onDateTimeChanged: (data) => widget.onIOSDateChanged!(data),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
