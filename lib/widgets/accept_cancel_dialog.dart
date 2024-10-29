// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/helloworldcounters/license/.

import 'package:flutter/material.dart';

/// Displays a Material dialog with "accept" and "cancel" buttons.
void showAcceptCancelDialog(
  BuildContext context,
  String message,
  String acceptButton,
  String cancelButton,
  VoidCallback onAccept,
) {
  showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(cancelButton.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(acceptButton.toUpperCase()),
              onPressed: () {
                onAccept();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
