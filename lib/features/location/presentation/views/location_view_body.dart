// features/location/presentation/views/location_view_body.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/features/location/presentation/views/widgets/list_location_item.dart';

class LocationViewBody extends StatelessWidget {
  var Searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: AppBar(
               // centerTitle: true,
              ),
            ),
       backgroundColor: Theme.of(context).canvasColor,
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                       vertical: 30,
                    ),
          child: Column(
            children: [
             ListView.separated(
              shrinkWrap: true,
              scrollDirection:Axis.vertical,
              itemBuilder: (context, index) =>
                  ListLocationItem(),
              separatorBuilder: (context, index) =>   Divider(thickness: 1, height: 0.1, color: LightAppColors.graycolor400),
              itemCount: 1),
             
              //
            ],
          ),
        ),
      ),
               floatingActionButton:  FloatingActionButton(
                mini: true,
                backgroundColor:  LightAppColors.primary700,
              shape: CircleBorder(),
                      onPressed: () {
                        
                      },
                      child: Icon(Icons.add,
                      color:  Colors.white,
                      ),
                    ),
    );
  }
}
