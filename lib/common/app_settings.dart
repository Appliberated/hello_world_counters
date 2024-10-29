// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/helloworldcounters/license/.

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
