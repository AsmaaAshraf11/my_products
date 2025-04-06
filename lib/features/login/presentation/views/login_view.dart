// features/login/presentation/views/login_view.dart
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';
import 'package:myproducts/core/validations/validations.dart';
import 'package:myproducts/features/login/presentation/manger/featured_datalogin_cubit/cubit/data_login_cubit.dart';
import 'package:myproducts/features/component/background_image.dart';
import 'package:myproducts/features/component/button.dart';
import 'package:myproducts/features/component/iconbutton_arrow_back.dart';
import 'package:myproducts/features/component/images_google_apple_fece.dart';
import 'package:myproducts/features/component/text_divider.dart';
import 'package:myproducts/features/login/presentation/views/widgets/text_forget_password.dart';
import 'package:myproducts/features/component/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();

  var passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool isobscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataLoginCubit, DataLoginState>(
      listener: (context, state) {
        if (state is DataLoginSuccess) {
          if (state.model.success == true) {
            AppPreferences appPreferences = getIt.get<AppPreferences>();

            appPreferences.setAuthToken(state.model.loginData!.accessToken);
            appPreferences.setIsLogged();
            appPreferences.setUserName('${state.model.loginData!.firstName}');
            print('id: ${state.model.loginData?.id}');
            pushRoute(
              context,
              Routes.layout,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("${state.model.message}"),
                backgroundColor: Colors.redAccent,
                duration: Duration(seconds: 2)));
          }
        }
        if (state is DataLoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${state.errMessage}"),
              backgroundColor: Colors.redAccent,
              duration: Duration(seconds: 2), //
            ),
          );
        }
        // TODO: implement listener
      },
      builder: (context, state) {
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
                  padding: const EdgeInsets.only(top: 90),
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
                                child: Form(
                                  key: _formkey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const HeadLine22(
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
                                        Validator: validateEmail,
                                        hintText:
                                            'Enter your Email or Username',
                                      ),
                                      14.h.heightSizedBox,
                                      const TitleText(
                                        text: 'Password',
                                      ),
                                      DefaultFormField(
                                          Controller: passwordController,
                                          isobscureText: isobscureText,
                                          Validator: validatePassword,
                                          hintText: 'Enter your Password',
                                          suffix: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isobscureText =
                                                      !isobscureText;
                                                });
                                              },
                                              icon: Icon(
                                                color:
                                                    LightAppColors.primary400,
                                                isobscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                              ))),
                                      46.h.heightSizedBox,
                                      ConditionalBuilder(
                                        builder: (BuildContext context) =>
                                            defaultButton(
                                          onPressed: () {
                                            // if (_formkey.currentState!.validate()){

                                            DataLoginCubit.get(context)
                                                .fetchDataLogin(
                                              name: emailcontroller.text,
                                              password: passwordController.text,
                                            );
                                            //  }
                                          },
                                          text: 'Login',
                                        ),
                                        condition: state is! DataLoginLoading,
                                        fallback: (BuildContext context) =>
                                            Center(
                                                child:
                                                    CircularProgressIndicator()),
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
                              ),
                            ]),
                      )))
            ],
          ),
        );
      },
    );
  }
}
