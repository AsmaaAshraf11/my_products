// features/changePassword/presentation/views/forget_Password_viewdart.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/component/background_image.dart';
import 'package:myproducts/features/component/button.dart';
import 'package:myproducts/features/component/iconbutton_arrow_back.dart';
import 'package:myproducts/features/component/text_form_field.dart';

class ForgetPasswordViewdart extends StatelessWidget {
   ForgetPasswordViewdart({super.key});
  var emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightAppColors.green300,
        elevation: 0,
      ),
      body: Stack(
      children: [
        const BackgroundImage(),
        IconbuttonArrowBack(
          route: Routes.loginScreen,
          iconColor: LightAppColors.primary700,
          buttonColor: Colors.white,
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 45,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadLine22(
                        text: 'Forget password',
                      ),
                      10.h.heightSizedBox,
                      const SmallHeader(
                          text:
                              'Its okay. Just type your Email and we will send a Link to reset your Password'),
                      35.h.heightSizedBox,
                      const TitleText(text: 'Email Address'),
                      DefaultFormField(
                        Controller: emailcontroller,
                        Type: TextInputType.emailAddress,
                        Validator: null,
                      ),
                      50.h.heightSizedBox,
                      defaultButton(
                        onPressed: () {
                          pushAndRemoveRoute(context, Routes.changePasswordScreen);
                        },
                        text: 'Send Link to Email',
                      ),
                    ],
                  ),
                )))
      ],
    )
      );
  }
}
