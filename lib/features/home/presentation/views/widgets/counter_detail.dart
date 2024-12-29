// features/home/presentation/views/widgets/counter_detail.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/home/presentation/views/widgets/count_button.dart';

class CounterDetail extends StatefulWidget {
  @override
  State<CounterDetail> createState() => _CounterDetailState();
}

class _CounterDetailState extends State<CounterDetail> {
   int number=1;

  @override
  Widget build(BuildContext context) {
    return Positioned(
                      top:230 ,
                      left: 130,
                      child: Row(
                        children: [
                               CircleAvatar(
                    radius: 18,
                    backgroundColor: LightAppColors.maincolorgreen700,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        setState(() {
                          number++;
                        });
                      }, icon: Icon(
                      Icons.add,color: LightAppColors.white,
                      size: 28,
                    )),
                  ),
                               Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40
                                ),
                                child: HeadLine22(text: '$number',
                                // style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                                ),
                              ),
                               CircleAvatar(
                    radius: 18,
                    backgroundColor: LightAppColors.maincolorgreen700,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        if(number>1){
                          setState(() {
                          number--;
                        });
                        }
                      }, icon: Icon(
                      Icons.remove,color: LightAppColors.white,
                      size: 28,
                    )),
                  )
                          
                        
                        ],),
                    );
  }
}