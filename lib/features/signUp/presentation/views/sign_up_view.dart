// features/signUp/presentation/views/sign_up_view.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/core/validations/validations.dart';
import 'package:myproducts/features/component/background_image.dart';
import 'package:myproducts/features/component/button.dart';
import 'package:myproducts/features/component/iconbutton_arrow_back.dart';
import 'package:myproducts/features/component/images_google_apple_fece.dart';
import 'package:myproducts/features/component/text_divider.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_forget_password.dart';
import 'package:myproducts/features/component/text_form_field.dart';
import 'package:myproducts/features/changePassword/presentation/views/widgets/text_password_validat.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var emailcontroller = TextEditingController();

  var passwordController = TextEditingController();

  var _formkey = GlobalKey<FormState>();

  bool isobscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: AppBar(
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: LightAppColors.green300!.withOpacity(0.6),
              ),
              backgroundColor: LightAppColors.green300,
            )),
        body: Stack(
          children: [
            const BackgroundImage(),
            IconbuttonArrowBack(
              route: Routes.start,
              iconColor: LightAppColors.primary700,
              buttonColor: Colors.white,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 70),
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
                        child: Form(
                          key: _formkey,
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
                                Validator: validateEmail,
                              ),
                              14.h.heightSizedBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Validator: validatePassword,
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
                                    ),
                                  )),
                              const TextPasswordValidat(),
                              36.h.heightSizedBox,
                              defaultButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    pushRoute(
                                      context,
                                      Routes.layout,
                                    );
                                  }
                                },
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
                      ),
                    )))
          ],
        ));
  }
}
