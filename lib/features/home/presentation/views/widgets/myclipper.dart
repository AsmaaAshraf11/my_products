// features/home/presentation/views/widgets/myclipper.dart
import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> { 
  @override 
  Path getClip(Size size) { 
    var path = Path(); 
    path.lineTo(0, size.height-70); 
     path.quadraticBezierTo(size.width*0.6,size.height+50, size.width, size.height-70);
    path.quadraticBezierTo(size.width*0.7,size.height, size.width, size.height-70);
        path.lineTo( size.width,0); 

    return path; 
  } 
  @override 
  bool shouldReclip(CustomClipper<Path> oldClipper) { 
    return true; 
  } 
}