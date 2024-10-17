import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/core/common/blocs/Favorite%20Locations%20Bloc/favorite_locations_bloc.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/widgets/custom_text_container.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/widgets/get_favorite_location_success_body.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key, required this.email});
  final String email;
  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    BlocProvider.of<FavoriteLocationsBloc>(context).add(
      GetFavoriteLocationsEvent(widget.email),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder<FavoriteLocationsBloc, FavoriteLocationsState>(
      builder: (context, state) {
        if (state is GetFavoriteLocationsSuccess) {
          return GetFavoriteLocationsSuccessBody(
            state: state,
            email: widget.email,
          );
        } else if (state is GetFavoriteLocationsFailure) {
          return CustomTextContainer(text: state.message);
        } else {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    ));
  }
}
