// features/signUp/presentation/views/widgets/sign_up_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/login/presentation/views/widgets/background_image.dart';
import 'package:myproducts/features/login/presentation/views/widgets/button.dart';
import 'package:myproducts/features/login/presentation/views/widgets/iconbutton_arrow_back.dart';
import 'package:myproducts/features/login/presentation/views/widgets/images_google_apple_fece.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_divider.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_forget_password.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_form_field.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_password_validat.dart';

class SignUpViewBody extends StatefulWidget {
  SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  var emailcontroller = TextEditingController();
  var passwordController = TextEditingController();

  bool isobscureText = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        IconbuttonArrowBack(
          route: Routes.start,
          iconColor: LightAppColors.maincolorgreen700,
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
                    top: 36,
                    left: 30,
                    right: 30,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadLine22(
                          text: 'Sign Up',
                        ),
                        10.h.heightSizedBox,
                        const SmallHeader(
                            text: 'Hi! Let' 's create your account.'),
                        25.h.heightSizedBox,
                        const TitleText(text: 'Email or Username'),
                        DefaultFormField(
                          Controller: emailcontroller,
                          Type: TextInputType.emailAddress,
                          hintText: 'Enter your Email or Username',
                          Validator: null,
                        ),
                        14.h.heightSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TitleText(
                              text: 'Password',
                            ),
                            TitleText(
                              text: 'Low...',
                              textColor: LightAppColors.pink0,
                            )
                          ],
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
                              ),
                            )),
                        const TextPasswordValidat(),
                        36.h.heightSizedBox,
                        defaultButton(
                          onPressed: () {},
                          text: 'Sign Up',
                        ),
                        const TextAndTextButton(
                          text1: 'Already have an account?',
                          text2: 'Log in',
                          Route: Routes.loginScreen,
                        ),
                        const TextDivider(),
                        const ImagesGoogleAppleFece(),
                      ],
                    ),
                  ),
                )))
      ],
    );
  }
}
