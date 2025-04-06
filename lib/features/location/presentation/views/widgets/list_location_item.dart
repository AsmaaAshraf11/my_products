// features/location/presentation/views/widgets/list_location_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/features/location/data/models/location._model.dart';
import 'package:myproducts/features/location/presentation/manger/cubit/fetch_location_cubit.dart';

class ListLocationItem extends StatelessWidget {
  const ListLocationItem({super.key, required this.location});
  // final String address;
  final LocationModel location;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchLocationCubit, FetchLocationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.location_on,
                  color: LightAppColors.primary,
                ),
              ),
              Expanded(
                child: TitleMedium(
                  fontSize: 17,
                  overflow: true,
                  text: location.address,
                  textColor: Theme.of(context).focusColor,
                  bold: true,
                ),
              ),
              PopupMenuButton(
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        // <PopupMenuEntry<String>>[
                        PopupMenuItem(
                          child: const Text(
                            'dalet',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          onTap: () {
                            FetchLocationCubit.get(context)
                                .DeleteLocation(location.id);
                            FetchLocationCubit.get(context).GetLocation();
                          },
                        ),
                      ]),
            ],
          ),
        );
      },
    );
  }
}
