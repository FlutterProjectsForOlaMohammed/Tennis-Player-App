import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/GetUserLocationBloc/get_user_location_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/destination_text_form_field.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/google_map_image_container.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/location_button.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/search_button.dart';
import 'package:tennis_player_app/core/Functions/empty_value_validation.dart';

class DetermineUserLocationBody extends StatefulWidget {
  const DetermineUserLocationBody({super.key});

  @override
  State<DetermineUserLocationBody> createState() =>
      _DetermineUserLocationBodyState();
}

class _DetermineUserLocationBodyState extends State<DetermineUserLocationBody> {
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> formKey = GlobalKey();
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const GoogleMapImageContainer(),
              LocationButton(
                onPressed: () {
                  BlocProvider.of<GetUserLocationBloc>(context).add(
                    const GetLocationEvent(),
                  );
                },
              ),
              DestinationTextFormField(
                hint: "Your Destination",
                onSaved: (value) {
                  cityName = value!;
                },
                validator: (value) {
                  return emptyValueValidation(value);
                },
                onTap: () async {
                  await scrollToBottom();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SearchButton(
                  text: "Search",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<GetUserLocationBloc>(context).add(
                        GetLocationEvent(userLocation: cityName),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  scrollToBottom() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    if (scrollController.hasClients) {
      await scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }
}
