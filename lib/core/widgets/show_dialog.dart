import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';
import 'package:tennis_player_app/core/widgets/dialog_header.dart';
import 'package:tennis_player_app/core/widgets/ok_button.dart';

void showingDialog(
  BuildContext context, {
  required String title,
  required IconData headerIcon,
}) {
  AwesomeDialog(
    btnOkColor: Colors.white,
    dialogBackgroundColor: Colors.white.withOpacity(0.8),
    customHeader: DialogHeader(
      headerIcon: headerIcon,
    ),
    context: context,
    dialogType: DialogType.info,
    title: title,
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: responsiveFontSize(context, baseFontSize: 26),
        fontWeight: FontWeight.w300),
    btnOk: const OkButton(),
    useRootNavigator: true,
    enableEnterKey: true,
  ).show();
}
