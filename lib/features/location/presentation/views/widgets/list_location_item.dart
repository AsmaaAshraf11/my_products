// features/location/presentation/views/widgets/list_location_item.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_text.dart';
  class ListLocationItem extends StatelessWidget {
  const ListLocationItem({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
         
          TitleMedium(
                    fontSize: 15,
                                      text: 'name location',
                                      textColor: Theme.of(context).focusColor,
                                      bold: true,
                                      //overflow: true,
                                    ),
          // Text(
          //   'name location',
          //   style: TextStyle(fontSize: 20, ),
          // ),
          // Spacer(),
          // Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
  }
