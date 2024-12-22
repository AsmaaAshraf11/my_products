// features/login/presentation/views/widgets/change_password_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/login/presentation/views/widgets/background_image.dart';
import 'package:myproducts/features/login/presentation/views/widgets/button.dart';
import 'package:myproducts/features/login/presentation/views/widgets/iconbutton_arrow_back.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_form_field.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_password_validat.dart';

class ChangePasswordViewBody extends StatefulWidget {
  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  var emailcontroller = TextEditingController();

  var passwordController = TextEditingController();
  bool isobscureText = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        const IconbuttonArrowBack(
          route: Routes.loginScreen,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 30.h.heightSizedBox,
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40,
                            left: 30,
                            right: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeadLine22(
                                text: 'Change password',
                              ),
                              10.h.heightSizedBox,
                              const SmallHeader(
                                  text:
                                      'Well Done! You successfully verified your account. Now Enter your new password.'),
                              35.h.heightSizedBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TitleText(
                                    text: 'Enter new password',
                                  ),
                                  SmallHeader(
                                    text: 'Strong...',
                                    color: LightAppColors.maincolorgreen400,
                                  )
                                ],
                              ),
                              DefaultFormField(
                                Controller: emailcontroller,
                                Type: TextInputType.emailAddress,
                                Validator: null,
                              ),
                              TextPasswordValidat(),
                              14.h.heightSizedBox,
                              const TitleText(
                                text: 'Repeat password',
                              ),
                              DefaultFormField(
                                  Controller: passwordController,
                                  isobscureText: isobscureText,
                                  Validator: null,
                                  hintText: 'Enter your Password',
                                  suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isobscureText = !isobscureText;
                                        });
                                      },
                                      icon: Icon(
                                        color: LightAppColors.maincolorgreen400,
                                        isobscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ))),
                              46.h.heightSizedBox,
                              defaultButton(
                                onPressed: () {},
                                text: 'Change password',
                              ),
                            ],
                          ),
                        ),
                      ]),
                )))
      ],
    );
  }
}
