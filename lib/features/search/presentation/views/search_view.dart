// features/search/presentation/views/search_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/extension/extensions.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/component/text_form_field.dart';
import 'package:myproducts/features/home/presentation/views/widgets/grid_view_popular.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_item.dart';
import 'package:myproducts/features/home/presentation/views/widgets/product_loading.dart';
import 'package:myproducts/features/search/presentation/manger/featured_search_cubit/search_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var Searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            
              // backgroundColor: LightAppColors.green300,
              ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                DefaultFormField(
                    Controller: Searchcontroller,
                    hintText: 'what do you want?',
                    Validator: (value) {
                      if (value.isEmpty) {
                        return 'rnter text to search';
                      }
                      return null;
                    },
                    onSubmit: (String text) {
                       SearchCubit.get(context).SearchProduct(text);
                    },
                    Prefix: Icons.search_rounded,
                    suffix: Icon(Icons.filter_list,color: LightAppColors.maincolorgreen400,)
                    ),
                    50.h.heightSizedBox,
                    Skeletonizer(
                                enabled: state is SearchLoading,
                                child: state is SearchSuccess
                                    ? Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: GridView.count(
                                                            shrinkWrap: true,
                                                            physics: NeverScrollableScrollPhysics(),
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing: 27,
                                                            mainAxisSpacing: 20,
                                                            childAspectRatio: .86,
                                                            children: List.generate(
                                                                state.products.length,
                                                                (index) => SizedBox(
                                                                  height:context.screenHeight*0.4,
                                                                  child: ProductItem(
                                                                        productsModel: state.products[index],
                                                                      ),
                                                                )),
                                                          ),
                                    )
                                    : state is SearchFailure
                      ? CustomErrorWidget(errMessage: state.errMessage)
                      :state is SearchLoading? ProductLoading():
                      TitleMedium(text: 'search',)
                    )
              ],
            ),
          ),
        );
      },
    );
  }
}
