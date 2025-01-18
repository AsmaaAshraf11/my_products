// features/profile/presentation/views/widgets/list_til.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';

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
            color: color ?? LightAppColors.black,
          ),

          title: Text(
            text,
            style: TextStyle(
              color: color,
            ),
          ),

          trailing: istrailing == true
              ? IconButton(
                onPressed: () {  },
                icon: Icon(
                    Icons.arrow_forward_ios,
                    color: LightAppColors.black,
                  ),
                
              )
              : trailing,

          // Icon(Icons.arrow_forward_ios,),
        ),
        Divider(thickness: 1, height: 0.1, color: LightAppColors.graycolor400)
      ],
    );
  }
}
