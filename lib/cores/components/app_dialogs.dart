import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';

class AppDialog {
  static showSuccessMessage(BuildContext context,
      {String message = "Success",
      IconData icon = Icons.check_circle,
      Color iconColor = Colors.green,
      Duration dialogDuration = const Duration(milliseconds: 1000)}) {
    Timer timer = Timer(dialogDuration, () {
      // back to root page
      // Navigator.pop(context);
      Navigator.pop(context);
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog.adaptive(
          content: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 55,
                ),
                16.toHeightGap(),
                Text(
                  message,
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        );
      },
    ).then(
      (value) {
        // dispose the timer in case something else has triggered the dismiss.
        timer.cancel();
      },
    );
  }
}
