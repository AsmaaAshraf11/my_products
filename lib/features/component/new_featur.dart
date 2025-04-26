// features/component/new_featur.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/views/widgets/mid_buttom.dart';

class NewFeatur extends StatelessWidget {
  const NewFeatur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
     
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.lock),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40
              ),
              child: TitleText(text: 'coming soon\nThis feature will be available soon',
              fontSize: 20,
            //  textColor:  LightAppColors.primary700,
              ),
            ),
            MidButtom(text: 'take me back', onPressed: (){
              Navigator.of(context).pop();
            },)
          ],
        ),
      ),
    );
  }
}