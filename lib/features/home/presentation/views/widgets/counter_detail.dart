// features/home/presentation/views/widgets/counter_detail.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';

class CounterDetail extends StatefulWidget {
  @override
  State<CounterDetail> createState() => _CounterDetailState();
}
 int number = 1;

class _CounterDetailState extends State<CounterDetail> {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 250,
      left: 130,
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: LightAppColors.primary700,
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    number++;
                  });
                },
                icon: Icon(
                  Icons.add,
                  color:Colors.white,
                  size: 28,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: HeadLine22(
              text: '$number',
              // style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            ),
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: LightAppColors.primary700,
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (number > 1) {
                    setState(() {
                      number--;
                    });
                  }
                },
                icon: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 28,
                )),
          )
        ],
      ),
    );
  }
}
