// features/home/presentation/views/widgets/product_loading.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Skeletonizer(
            //enabled: true,
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 27,
              mainAxisSpacing: 20,
              childAspectRatio: .9,
              children: List.generate(
                6, // Display a placeholder grid with skeletons
                (index) => Container(
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 8)
            ],
           
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  
                  icon: Icon(
                    Icons.favorite,
                  ), onPressed: () {  },
                ),
              ),
             
              Image.asset(
                ImageAssets.imge1,
                width: 100,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const TitleMedium(
                  overflow: true,
                  text: '',
                ),
                RichText(
                  text: const TextSpan(
                    text: '                 ',
                    children: [
                      TextSpan(
                        text: '${'/kg'}',
                    ),
                    ],
                  ),
                ),
               
              ])
            ],
          )),
              ),
            )
    );
  }
}


// );
//     }
//         );
//     }
    
//   }