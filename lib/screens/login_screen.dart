import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/helper/responsive_helper.dart';
import 'package:numattendance/helper/router_helper.dart';
import 'package:numattendance/helper/validate_check.dart';
import 'package:numattendance/widgets/custom_bottom.dart';
import 'package:numattendance/widgets/custom_text_field.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';
import 'package:numattendance/widgets/segment_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  final Map<String, TextEditingController> _controllers = {
    'username': TextEditingController(),
    'password': TextEditingController(),
  };

  GlobalKey<FormState>? _formKeySignUp;

  @override
  void initState() {
    super.initState();
    _formKeySignUp = GlobalKey<FormState>();
    // Add scroll listener to monitor scrolling
  }

  String? selectedRole = "student";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: Get.width > 700
            ? const EdgeInsets.all(Dimensions.paddingSizeDefault)
            : null,
        width: Get.width > 700 ? 700 : Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                TColor.primaryColor,
                TColor.bg,
              ],
              stops: [
                0.7,
                0.7
              ]),
        ),
        child: ResponsiveHelper.isDesktop(context)
            ? SizedBox()
            : SingleChildScrollView(
                child: Stack(
                  children: [
                    Positioned(
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.40,
                            color: TColor.primaryColor,
                          ),
                          Container(
                            // height: Get.height * 0.65,
                            color: TColor.bg,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Form(
                        key: _formKeySignUp,
                        child: Padding(
                          padding: ResponsiveHelper.isDesktop(context)
                              ? const EdgeInsets.all(40)
                              : EdgeInsets.zero,
                          child: Column(
                            children: [
                              SizedBox(
                                height: Dimensions.paddingSizeExtraLarge * 3,
                              ),
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
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(90),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      SegmentWidget(
                                        onChangeData: (getRole) {
                                          setState(() {
                                            selectedRole =
                                                getRole.toLowerCase();
                                          });
                                          _resetForm();
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                            Dimensions.paddingSizeExtraLarge,
                                      ),
                                      Padding(
                                        padding: Get.width > 700
                                            ? const EdgeInsets.all(0)
                                            : const EdgeInsets.only(
                                                left:
                                                    Dimensions.paddingSizeLarge,
                                                right:
                                                    Dimensions.paddingSizeLarge,
                                                bottom: Dimensions
                                                    .paddingSizeExtremeLarge),
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                selectedRole == "parent"
                                                    ? "Parent Login"
                                                    : selectedRole == "teacher"
                                                        ? "Teacher Login"
                                                        : "Student Login",
                                                style: robotoBold.copyWith(
                                                  fontSize: Dimensions
                                                      .paddingSizeExtraLarge,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Dimensions
                                                  .paddingSizeExtraLarge,
                                            ),
                                            CustomTextField(
                                              labelText: "Username",
                                              required: true,
                                              controller:
                                                  _controllers['username'],
                                              focusNode: _usernameFocus,
                                              nextFocus: _passwordFocus,
                                              inputType: TextInputType.name,
                                              capitalization:
                                                  TextCapitalization.words,
                                              labelTextSize:
                                                  Dimensions.fontSizeDefault(
                                                      context),
                                              validator: (value) =>
                                                  ValidateCheck
                                                      .validateEmptyText(
                                                          value, null),
                                            ),
                                            SizedBox(
                                              height: Dimensions
                                                  .paddingSizeExtraLarge,
                                            ),
                                            CustomTextField(
                                              labelText: "Password",
                                              isPassword: true,
                                              controller:
                                                  _controllers['password'],
                                              required: true,
                                              focusNode: _passwordFocus,
                                              inputAction: TextInputAction.done,
                                              labelTextSize:
                                                  Dimensions.fontSizeDefault(
                                                      context),
                                              inputType:
                                                  TextInputType.visiblePassword,
                                              validator: (value) =>
                                                  ValidateCheck
                                                      .validateEmptyText(
                                                          value, null),
                                            ),
                                            Row(
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Forgot Password ?",
                                                    style:
                                                        robotoMedium.copyWith(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "or",
                                                ),
                                                TextButton(
                                                  onPressed: () => Get.toNamed(
                                                      RouterHelper
                                                          .getStudentRegisterRoute()),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(Dimensions
                                                            .paddingSizeExtraSmall),
                                                    child: Text("Register",
                                                        style: robotoMedium
                                                            .copyWith(
                                                                color: TColor
                                                                    .lateColore)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimensions
                                                  .paddingSizeExtraLarge,
                                            ),
                                            CustomBottom(
                                              color: TColor.primaryColor,
                                              fontSize:
                                                  Dimensions.paddingSizeDefault,
                                              width: Get.width,
                                              transparent: false,
                                              buttonText: "Login",
                                              radius: Dimensions.radiusDefault,
                                              onPressed: () {
                                                _formKeySignUp!.currentState!
                                                    .validate();
                                                if (_formKeySignUp!
                                                    .currentState!
                                                    .validate()) {
                                                  if (selectedRole ==
                                                      "parent") {
                                                    Get.offAllNamed(RouterHelper
                                                        .getParentScreen());
                                                  } else {
                                                    Get.offAllNamed(RouterHelper
                                                        .getHomeScreen(
                                                            selectedRole!));
                                                  }
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              height: Get.width * 0.2,
                                            ),
                                            Center(
                                              child: Text.rich(
                                                textAlign: TextAlign.center,
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Address\n",
                                                      style: robotoRegular
                                                          .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "St.96 Christopher Howes Khan Daun\nPenh, Phnom Penh, Cambodia",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                  ],
                ),
              ),
      ),
    );
  }

  void _resetForm() {
    _formKeySignUp!.currentState!.reset();
    _controllers.forEach((key, controller) => controller.clear());
    FocusScope.of(context).unfocus();
  }
}
