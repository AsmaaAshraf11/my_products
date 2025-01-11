// features/login/presentation/views/widgets/login_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';
import 'package:myproducts/features/home/presentation/manger/featured_datalogin_cubit/cubit/data_login_cubit.dart';
import 'package:myproducts/features/login/presentation/views/widgets/background_image.dart';
import 'package:myproducts/features/login/presentation/views/widgets/button.dart';
import 'package:myproducts/features/login/presentation/views/widgets/iconbutton_arrow_back.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_forget_password.dart';
import 'package:myproducts/features/login/presentation/views/widgets/images_google_apple_fece.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_divider.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_form_field.dart';
import 'package:myproducts/core/di/service_locator.dart';


class LoginViewBody extends StatefulWidget {
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var emailcontroller = TextEditingController();

  var passwordController = TextEditingController();

  bool isobscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataLoginCubit, DataLoginState>(
      listener: (context, state) {
         AppPreferences appPreferences=getIt.get<AppPreferences>();
        if(state is DataLoginSuccess){
        
         appPreferences.setAuthToken(state.model.accessToken);
          appPreferences.setIsLogged();
          //var mode = DataLoginCubit.get(context).r
          pushRoute(context, Routes.layout,arguments: state.model);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
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
                                    text: 'Log In',
                                  ),
                                  10.h.heightSizedBox,
                                  const SmallHeader(
                                      text:
                                          'Welcome Back! Log in with your details'),
                                  35.h.heightSizedBox,
                                  const TitleText(
                                    text: 'Email or Username',
                                  ),
                                  DefaultFormField(
                                    Controller: emailcontroller,
                                    Type: TextInputType.emailAddress,
                                    Validator: null,
                                    hintText: 'Enter your Email or Username',
                                  ),
                                  14.h.heightSizedBox,
                                  const TitleText(
                                    text: 'Password',
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
                                            color: LightAppColors
                                                .maincolorgreen400,
                                            isobscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ))),
                                  46.h.heightSizedBox,
                                  defaultButton(
                                    onPressed: () {
                                      DataLoginCubit.get(context).fetchDataLogin(name:'emilys' , password:'emilyspass',);

                                      //pushRoute(context, Routes.layout);
                                    },
                                    text: 'Login',
                                  ),
                                  const TextAndTextButton(
                                    text1: 'Forget your password?',
                                    text2: 'Reset password',
                                    Route: Routes.forgetPasswordScreen,
                                  ),
                                  const TextDivider(),
                                  const ImagesGoogleAppleFece(),
                                ],
                              ),
                            ),
                          ]),
                    )))
          ],
        );
      },
    );
  }
}
