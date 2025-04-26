// features/profile/presentation/views/widgets/image_profile.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
   final picker = ImagePicker();
     File? _image;
     bool image=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Stack(children: [
            SizedBox(
              // width: 120.w,
              //  height: 120.h,
              child:
              //  _image != null?
                 CircleAvatar(
                radius: 70,
                // ignore: unnecessary_null_comparison
                backgroundImage: image==true? FileImage(_image!):const AssetImage(ImageAssets.profile),
                //AssetImage(ImageAssets.profile),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: LightAppColors.primary400,
                    radius: 17,
                    child: IconButton(
                        onPressed: ()async {
                           final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
           image=true;
        } 
      });
                        },
                        icon: Icon(
                          Icons.camera_enhance,
                          size: 19,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
