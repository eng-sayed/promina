import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../presentation/componants/snackbar.dart';

enum SnakState { success, failed }

class OverLays {
  static snack(BuildContext context,
      {required String text, required SnakState state}) {
    BotToast.showCustomText(
        align: Alignment.center,
        onlyOne: true,
        toastBuilder: (s) => SnackDesgin(state, text));
  }
}
