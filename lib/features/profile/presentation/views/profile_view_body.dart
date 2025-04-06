// features/profile/presentation/views/profile_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/core/shared_preferences/app_prefs.dart';
import 'package:myproducts/features/home/presentation/manger/theme/cubit/theme_cubit.dart';
import 'package:myproducts/features/profile/presentation/views/widgets/list_til.dart';
import 'package:myproducts/features/profile/presentation/views/widgets/min_button.dart';

import 'widgets/image_profile.dart';

class ProfileViewBody extends StatefulWidget {
  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  var Searchcontroller = TextEditingController();

  bool notifications = false;
  bool isdark = false;
  final switchDarkController = ValueNotifier<bool>(false);
    final switchController = ValueNotifier<bool>(false);


  AppPreferences appPreferences = getIt.get<AppPreferences>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTheme();
  }

  Future<void> getTheme() async {
    bool drk = await appPreferences.isDarkMode();
    setState(() {
      isdark = drk;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Column(
          children: [
            50.h.heightSizedBox,
            const ImageProfile(),
            const HeadLine22(
              text: 'Aml Kamal',
            ),
            const TitleMedium(
              text: '@amlkamal',
            ),
            MinButton(
              text: 'Edit profile',
              onPressed: () {},
            ),
            ListTil(
              icon: Icons.settings,
              istrailing: true,
              text: 'Setting',
            ),
            ListTil(
              icon: Icons.help,
              istrailing: true,
              text: 'Git help',
            ),
            ListTil(
              icon: Icons.language,
              text: 'Language',
              istrailing: true,
            ),
            ListTil(
              icon: Icons.location_on,
              istrailing: true,
              text: 'Manage Location',
            ),
            ListTil(
              icon: Icons.wallet_travel,
              istrailing: true,
              text: 'My wallet',
            ),
            ListTil(
              icon: Icons.notifications,
              text: 'Notification',
              trailing: AdvancedSwitch(
                onChanged: (valu) {
                  setState(() {
                   
                  });
                },
                activeColor: LightAppColors.primary700,
                width: 56,height: 28,
                controller: switchController,
              ),
            ),
            ListTil(
              icon: Icons.dark_mode,
              text: 'Dark mode',
              trailing: AdvancedSwitch(
                onChanged: (valu) {
                  setState(() {
                    isdark = valu;
                    print('value :$valu');
                    ThemeCubit.get(context).setDarkMode(valu);
                  });
                },
                activeColor: LightAppColors.primary700,
                width: 56,height: 28,
                controller: switchDarkController,
              ),
            ),
            // ListTil(
            //   icon: Icons.logout,
            //   text: 'Log out',
            //   color: LightAppColors.red,
            // ),
            GestureDetector(
              onTap: () {
                appPreferences.logout();
                pushAndRemoveRoute(
                  context,
                  Routes.loginScreen,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: LightAppColors.red,
                    ),
                    15.widthSizedBox,
                    Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 17,
                        color: LightAppColors.red,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
