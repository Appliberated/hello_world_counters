// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/helloworldcounters/license/.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

/// Formats [number] as a decimal, inserting locale-appropriate thousands separators as necessary.
String toDecimalString(BuildContext context, int number) {
  final MaterialLocalizations localizations = MaterialLocalizations.of(context);
  return localizations.formatDecimal(number);
}

/// Launches the specified [URL] in the mobile platform, using the default external application.
///
/// Shows an error [SnackBar] if there is no support for launching the URL.
Future<void> launchUrlExternal(BuildContext context, String url) async {
  try {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } on PlatformException catch (e) {
    if (!context.mounted) return;
    showSnackBar(context, 'Failed to open $url: ${e.message}');
  }
}

/// Shows a [SnackBar] with the specified [text] at the bottom of the specified scaffold.
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}

/// Utility Color extension methods.
extension ColorX on Color {
  /// Returns the contrast color for this color.
  Color contrastOf() {
    return ThemeData.estimateBrightnessForColor(this) == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}
