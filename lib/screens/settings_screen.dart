// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/helloworldcounters/license/.

import 'package:flutter/material.dart';

import '../common/app_settings.dart';
import '../common/strings.dart' as strings;

/// The settings screen widget that allows the user to change app settings.
///
/// Currently, the only setting is a switch to toggle between the two counter tap modes.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.appSettings,
  });

  /// The app settings.
  final AppSettings appSettings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width >= 800.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.settingsTitle),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: isLargeScreen ? const EdgeInsets.symmetric(vertical: 32.0) : null,
        child: ConstrainedBox(
          // Limit the width of the settings content to 800 pixels on large screens
          constraints: const BoxConstraints(maxWidth: 800.0),
          child: ListView(
            children: <Widget>[
              SwitchListTile(
                activeColor: Colors.black,
                value: widget.appSettings.counterTapMode,
                title: const Text(strings.counterTapModeTitle),
                subtitle: const Text(strings.counterTapModeSubtitle),
                onChanged: (bool value) =>
                    setState(() => widget.appSettings.counterTapMode = value),
              )
            ],
          ),
        ),
      ),
    );
  }
}
