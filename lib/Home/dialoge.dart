import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void ShowMessage(BuildContext context, String message,
    {String? posActionName, VoidCallback? posAction}) {
  List<Widget> actions = [];
  if (posActionName != null) {
    actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          if (posAction != null) posAction();
        },
        child: Text(posActionName)));
  }
  showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          actions: actions,
          content: Text(message),
        );
      });
}

void ShowLoading(BuildContext context, String message,
    {String? posActionName, VoidCallback? posAction}) {
  List<Widget> actions = [];
  if (posActionName != null) {
    actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          if (posAction != null) posAction();
        },
        child: Text(posActionName)));
  }
  showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          actions: actions,
          content: Row(
            children: [
              Lottie.asset('assets/lotti/loading.zip', width: 30),
              SizedBox(
                width: 12,
              ),
              Text(message),
            ],
          ),
        );
      });
}
