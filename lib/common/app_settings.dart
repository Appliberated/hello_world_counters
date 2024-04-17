// Copyright 2020-2024 Appliberated (https://appliberated.com). All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// @author TechAurelian <dev@techaurelian.com> (https://techaurelian.com)

import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  bool _counterTapMode = false;

  bool get counterTapMode => _counterTapMode;

  set counterTapMode(bool value) {
    _counterTapMode = value;
    _saveCounterTapMode();
  }

  static const String _counterTapModeKey = 'counterTapMode';

  /// Saves the counter tap mode to persistent storage.
  Future<void> _saveCounterTapMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_counterTapModeKey, _counterTapMode);
  }

  /// Loads app settings from persistent storage.
  Future<void> load() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counterTapMode = preferences.getBool(_counterTapModeKey) ?? false;
  }
}
