import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/view%20models/Favorite%20Locations%20Bloc/favorite_locations_bloc.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/widgets/custom_text_container.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/widgets/favorite_location_list_tile.dart';

class GetFavoriteLocationsSuccessBody extends StatelessWidget {
  const GetFavoriteLocationsSuccessBody({
    super.key,
    required this.state,
  });
  final GetFavoriteLocationsSuccess state;
  @override
  Widget build(BuildContext context) {
    if (state.locations.isEmpty) {
      return const CustomTextContainer(
        text: "There is No Favorite Location",
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return FavLocationListTile(
          cityName: state.locations[index].location,
          lat: state.locations[index].lat,
          lon: state.locations[index].lon,
        );
      },
      itemCount: state.locations.length,
    );
  }
}
