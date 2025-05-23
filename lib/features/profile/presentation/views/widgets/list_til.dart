// features/profile/presentation/views/widgets/list_til.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';

class ListTil extends StatelessWidget {
  ListTil(
      {required this.icon,
      required this.text,
      this.trailing,
      this.istrailing,
      this.color});
  IconData icon;
  String text;
  Widget? trailing;
  bool? istrailing;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: color ?? Theme.of(context).focusColor,
          ),

          title: Text(
            text,
            style: TextStyle(
              color: color ?? Theme.of(context).focusColor,
            ),
          ),

          trailing: istrailing == true
              ?IconButton( 
                icon:  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).focusColor,
                  ), onPressed: () { 
                     pushRoute(context, Routes.newFeatur);
                   },
              )
              : trailing,

          // Icon(Icons.arrow_forward_ios,),
        ),
        Divider(thickness: 1, height: 0.1, color: LightAppColors.graycolor400)
      ],
    );
  }
}
