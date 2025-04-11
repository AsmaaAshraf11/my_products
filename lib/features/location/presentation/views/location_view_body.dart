// features/location/presentation/views/location_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/di/service_locator.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/features/location/data/models/location._model.dart';
import 'package:myproducts/features/location/data/repos/location_repo_impl.dart';
import 'package:myproducts/features/location/domain/use_cases/fetchlocation_use_cases.dart';
import 'package:myproducts/features/location/presentation/manger/cubit/fetch_location_cubit.dart';
import 'package:myproducts/features/location/presentation/views/widgets/list_location_item.dart';

// ignore: must_be_immutable
class LocationViewBody extends StatelessWidget {
  var Searchcontroller = TextEditingController();

  LocationViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'your places',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Theme.of(context).focusColor,),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: BlocProvider(
        create: (context) {
          return FetchLocationCubit(FetchLocationUseCases(
            getIt.get<LocationRepoImpl>(),
          ))
            ..GetLocation();
        },
        child: BlocConsumer<FetchLocationCubit, FetchLocationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            List<LocationModel> location =
                FetchLocationCubit.get(context).locations;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    //  vertical: 30,
                    ),
                child: Column(
                  children: [
                    if (state is GetLocationSuccess)
                      ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => ListLocationItem(
                                location: location[index],
                              ),
                          separatorBuilder: (context, index) => Divider(
                              thickness: 1,
                              height: 0.1,
                              color: LightAppColors.graycolor400),
                          itemCount: location.length),

                    //
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: LightAppColors.primary700,
        shape: const CircleBorder(),
        onPressed: () {
          pushRoute(
            context,
            Routes.GoogleMapsView,
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
