// Copyright 2020-2024 Appliberated (https://appliberated.com). All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// @author TechAurelian <dev@techaurelian.com> (https://techaurelian.com)

import 'package:flutter/material.dart';

import '../common/app_settings.dart';
import '../common/app_strings.dart';

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
        title: const Text(AppStrings.settingsTitle),
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
                title: const Text(AppStrings.counterTapModeTitle),
                subtitle: const Text(AppStrings.counterTapModeSubtitle),
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
