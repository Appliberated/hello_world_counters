// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/app_settings.dart';
import '../common/app_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
    required this.appSettings,
  }) : super(key: key);

  final AppSettings appSettings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settingsTitle),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            activeColor: Colors.black,
            value: widget.appSettings.counterTapMode,
            title: const Text(AppStrings.counterTapModeTitle),
            subtitle: const Text(AppStrings.counterTapModeSubtitle),
            onChanged: (bool value) => setState(() => widget.appSettings.counterTapMode = value),
          )
        ],
      ),
    );
  }
}
