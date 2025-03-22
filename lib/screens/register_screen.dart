import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/controllers/auth_controller.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/helper/date_converter.dart';
import 'package:numattendance/helper/responsive_helper.dart';
import 'package:numattendance/helper/router_helper.dart';
import 'package:numattendance/helper/validate_check.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/widgets/custom_bottom.dart';
import 'package:numattendance/widgets/custom_dropdown.dart';
import 'package:numattendance/widgets/custom_text_field.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/app_constants.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? gender;
  String? academicYear;
  String? academicClass;
  String? major;

  GlobalKey<FormState>? _formKeySignUp;

  @override
  void initState() {
    super.initState();
    _formKeySignUp = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () => Get.back(),
        context: context,
        title: "",
      ),
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return SingleChildScrollView(
            child: Container(
              margin: Get.width > 700
                  ? const EdgeInsets.all(Dimensions.paddingSizeDefault)
                  : null,
              color: TColor.primaryColor,
              width: Get.width > 700 ? 700 : Get.width,
              child: Form(
                key: _formKeySignUp,
                child: Padding(
                  padding: ResponsiveHelper.isDesktop(context)
                      ? const EdgeInsets.all(40)
                      : EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.logo,
                        width: 122,
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeExtraLarge,
                      ),
                      Text(
                        "welcome to num attendance".toUpperCase(),
                        style: robotoBold.copyWith(
                            fontSize: Dimensions.paddingSizeLarge,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeExtraLarge,
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(90)),
                        child: Container(
                          color: Colors.white,
                          padding: Get.width > 700
                              ? const EdgeInsets.all(0)
                              : const EdgeInsets.only(
                                  left: Dimensions.paddingSizeLarge,
                                  right: Dimensions.paddingSizeLarge,
                                  bottom: Dimensions.paddingSizeExtremeLarge),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Dimensions.paddingSizeLarge,
                              ),
                              Text(
                                "Register",
                                style: robotoBold.copyWith(
                                  fontSize: Dimensions.paddingSizeExtraLarge,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeLarge,
                              ),
                              CustomTextField(
                                labelText: "Username",
                                required: true,
                                controller: _usernameController,
                                focusNode: _usernameFocus,
                                nextFocus: _passwordFocus,
                                inputType: TextInputType.name,
                                capitalization: TextCapitalization.words,
                                labelTextSize:
                                    Dimensions.fontSizeDefault(context),
                                validator: (value) =>
                                    ValidateCheck.validateEmptyText(
                                        value, null),
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeLarge,
                              ),
                              CustomTextField(
                                labelText: "Email",
                                required: true,
                                controller: _emailController,
                                focusNode: _emailFocus,
                                nextFocus: _passwordFocus,
                                inputType: TextInputType.name,
                                capitalization: TextCapitalization.words,
                                labelTextSize:
                                    Dimensions.fontSizeDefault(context),
                                validator: (value) =>
                                    ValidateCheck.validateEmail(value),
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeLarge,
                              ),
                              CustomTextField(
                                labelText: "Phone",
                                controller: _phoneController,
                                required: true,
                                focusNode: _phoneFocus,
                                inputAction: TextInputAction.done,
                                labelTextSize:
                                    Dimensions.fontSizeDefault(context),
                                inputType: TextInputType.number,
                                validator: (value) =>
                                    ValidateCheck.validatePhone(value, null),
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeLarge,
                              ),
                              CustomTextField(
                                required: true,
                                labelText: "Date of Birth",
                                hintText: "Date of Birth",
                                isOnTap: true,
                                labelTextSize:
                                    Dimensions.fontSizeDefault(context),
                                controller: _dateOfBirthController,
                                isReadOnly: true,
                                isShowCursor: false,
                                isSelectDate: true,
                                onAndroidDateChanged: (date) {
                                  _dateOfBirthController.text =
                                      DateConverter.dateToReadableDate(date);
                                },
                                onIOSDateChanged: (date) {
                                  _dateOfBirthController.text =
                                      DateConverter.dateToReadableDate(date);
                                },
                                validator: (value) =>
                                    ValidateCheck.validateEmptyText(
                                        value, null),
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeLarge,
                              ),
                              SizedBox(
                                width: Dimensions.paddingSizeSmall,
                              ),
                              CustomDropDown(
                                title: "Gender",
                                required: true,
                                value: gender,
                                isOnChange: (value) {
                                  gender = value.trim();
                                },
                                validator: (value) =>
                                    ValidateCheck.validateEmptyText(
                                        value, "    This filed is required"),
                                listDropdown: AppConstants.studentGender,
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeLarge,
                              ),
                              CustomTextField(
                                labelText: "Password",
                                isPassword: true,
                                controller: _passwordController,
                                required: true,
                                focusNode: _passwordFocus,
                                inputAction: TextInputAction.done,
                                labelTextSize:
                                    Dimensions.fontSizeDefault(context),
                                inputType: TextInputType.visiblePassword,
                                validator: (value) =>
                                    ValidateCheck.validateEmptyText(
                                        value, null),
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeLarge,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CustomDropDown(
                                      title: "Academic Year",
                                      required: true,
                                      value: academicYear,
                                      isOnChange: (value) {
                                        academicYear = value.trim();
                                      },
                                      validator: (value) =>
                                          ValidateCheck.validateEmptyText(value,
                                              "    This filed is required"),
                                      listDropdown: AppConstants.academinYear,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.paddingSizeSmall,
                                  ),
                                  Expanded(
                                    child: CustomDropDown(
                                      title: "Academic Class",
                                      required: true,
                                      value: academicClass,
                                      isOnChange: (value) {
                                        academicClass = value.trim();
                                      },
                                      validator: (value) =>
                                          ValidateCheck.validateEmptyText(value,
                                              "    This filed is required"),
                                      listDropdown: AppConstants.admissionClass,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeLarge,
                              ),
                              CustomDropDown(
                                title: "Major",
                                required: true,
                                value: major,
                                isOnChange: (value) {
                                  major = value.trim();
                                },
                                validator: (value) =>
                                    ValidateCheck.validateEmptyText(
                                        value, "    This filed is required"),
                                listDropdown: AppConstants.major,
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeExtraLarge,
                              ),
                              CustomBottom(
                                color: TColor.primaryColor,
                                fontSize: Dimensions.paddingSizeDefault,
                                width: Get.width,
                                isLoading: authController.isLoading,
                                transparent: false,
                                buttonText: "Register",
                                radius: Dimensions.radiusDefault,
                                onPressed: () => _register(authController),
                              ),
                              SizedBox(
                                height: Dimensions.paddingSizeSmall,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have account?",
                                    style: robotoRegular.copyWith(
                                        color: Theme.of(context).hintColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        Dimensions.paddingSizeExtraSmall),
                                    child: TextButton(
                                      onPressed: () => Get.offAllNamed(
                                          RouterHelper.getLoginRoute()),
                                      child: Text("Login",
                                          style: robotoMedium.copyWith(
                                              color: TColor.lateColore)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _register(AuthController authController) {
    // String username = _usernameController.text.trim();
    // String email = _emailController.text.trim();
    // String password = _passwordController.text.trim();
    // String dateOfBirth = _dateOfBirthController.text.trim();

    // print(
    //     "\n UserName : $username \n Password : $password \n Email : $email \n DOB : $dateOfBirth \n Gender :$gender \n Ac Class : $academicClass \n Ac Year :  $academicYear \n Majore :$major");
    if (_formKeySignUp!.currentState!.validate()) {
      // UserModel userBody = UserModel(
      //   username: username,
      //   email: email,
      //   password: password,
      //   dateOfBirth: DateConverter.dateStringToDate(dateOfBirth),
      //   role: "student",
      //   gender: gender,
      //   generation: "29/54",
      //   majorId: major,
      //   academinYear: academicYear,
      //   admissionClass: academicClass,
      //   registrationNum: "",
      // );
    }
  }
}
