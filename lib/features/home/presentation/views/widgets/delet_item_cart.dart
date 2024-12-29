// features/home/presentation/views/widgets/delet_item_cart.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myproducts/core/extension/extensions.dart';

class DeletItemCart extends StatelessWidget {
  const DeletItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin:EdgeInsets.all(15),
                     height:context.screenHeight*0.1,
                     padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                    color:Colors.red.shade100,
                    borderRadius: BorderRadius.circular(20)
                    ),
                    
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(FontAwesomeIcons.solidTrashCan,
                      color: Colors.red,
                      size: 30,
                      ),
                    ),
                  ) ;
  }
}