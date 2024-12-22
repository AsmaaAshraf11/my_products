// features/profile/presentation/views/profile_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/profile/presentation/views/widgets/list_til.dart';
import 'package:myproducts/features/profile/presentation/views/widgets/min_button.dart';
class ProfileViewBody extends StatefulWidget {
  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  var Searchcontroller = TextEditingController();

   bool  notifications=false; 
   bool  isdark=false;  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        50.h.heightSizedBox,        
        HeadLine22(
          text: 'Aml Kamal',
        ),
        TitleMedium(
          text: '@amlkamal',
        ),
        MinButton(
          text: 'Edit profile',
          onPressed: () {},
        ),
        ListTil(
          icon: Icons.settings,istrailing: true,text: 'Setting',),
        ListTil(
          icon: Icons.help,istrailing: true,text: 'Git help',),
        ListTil(
          icon: Icons.language, text: 'Language', istrailing: true,),
        ListTil(
          icon: Icons.location_on,istrailing: true,text: 'Manage Location',),
        ListTil(
          icon: Icons.wallet_travel,istrailing: true,text: 'My wallet',),
        ListTil(
          icon: Icons.notifications,
          text: 'Notification',
          trailing: 
          Switch(value: notifications,
          activeTrackColor: LightAppColors.maincolorgreen700,
                 activeColor: LightAppColors.white,
            onChanged: (bool value) {  
               setState(() {
              notifications=value;
            });
            },
           ),),
        ListTil(
          icon: Icons.dark_mode, text: 'Dark mode',
          trailing: Switch(value: isdark,
          activeTrackColor: LightAppColors.maincolorgreen700,
                 activeColor: LightAppColors.white,
            onChanged: (bool value) {  
               setState(() {
              isdark=value;
            });
            },
           ),
        ),
        ListTil(
          icon: Icons.logout,text: 'Log out', color: LightAppColors.red,),
        
      ],
    );
  }
}
