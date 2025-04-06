// features/changePassword/presentation/views/change_password_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/component/background_image.dart';
import 'package:myproducts/features/component/button.dart';
import 'package:myproducts/features/component/text_form_field.dart';
import 'package:myproducts/features/component/iconbutton_arrow_back.dart';
import 'package:myproducts/features/changePassword/presentation/views/widgets/text_password_validat.dart';

class ChangePaswordView extends StatefulWidget {
  ChangePaswordView({super.key});

  @override
  State<ChangePaswordView> createState() => _ChangePaswordViewState();
}

class _ChangePaswordViewState extends State<ChangePaswordView> {
  var emailcontroller = TextEditingController();

  var passwordController = TextEditingController();

  bool isobscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            backgroundColor: LightAppColors.green300,
          )),
      body: Stack(
        children: [
          const BackgroundImage(),
          IconbuttonArrowBack(
            route: Routes.forgetPasswordScreen,
            iconColor: LightAppColors.primary700,
            buttonColor: Colors.white,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 120),
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
                                HeadLine22(
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
                                      color: LightAppColors.primary400,
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
                                          color: LightAppColors.primary400,
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
      ),
    );
  }
}
