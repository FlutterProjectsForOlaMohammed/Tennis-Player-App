import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/widgets/cancellation_button.dart';
import 'package:tennis_player_app/core/widgets/dialog_header.dart';
import 'package:tennis_player_app/core/widgets/ok_button.dart';

void showingDialog(BuildContext context) {
  AwesomeDialog(
    dialogBackgroundColor: Colors.white.withOpacity(0.8),
    customHeader: const DialogHeader(),
    context: context,
    dialogType: DialogType.info,
    title: "Are You Sure ?",
    titleTextStyle: const TextStyle(
        color: Colors.black, fontSize: 26, fontWeight: FontWeight.w300),
    btnOk: const OkButton(),
    btnCancel: const CancelButton(),
  ).show();
}
