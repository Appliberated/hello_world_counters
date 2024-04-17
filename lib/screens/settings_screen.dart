// Copyright 2020-2024 Appliberated (https://appliberated.com). All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// @author TechAurelian <dev@techaurelian.com> (https://techaurelian.com)

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
