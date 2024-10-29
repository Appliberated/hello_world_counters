// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/helloworldcounters/license/.

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

/// Counter (color) types.
enum CounterType { black, white, red, green, yellow, blue, brown, purple, pink, orange, grey }

/// An integer counter class.
class Counter {
  /// Creates a counter of the specified [type].
  Counter(this.type);

  /// The counter value.
  int _value = 0;

  /// Returns the counter value.
  int get value => _value;

  /// Private setter that sets the counter value.
  void _setValue(int value) {
    _value = value;
    _saveValue();
  }

  /// Increments the counter value.
  void increment() {
    _setValue(value + 1);
  }

  /// Decrements the counter value.
  void decrement() {
    _setValue(value - 1);
  }

  /// Resets the counter value to zero.
  void reset() {
    _setValue(0);
  }

  /// Returns the persistent storage key for each counter type.
  static String _counterKey(CounterType type) => '${type.name}_counter';

  /// Saves the counter value to persistent storage.
  Future<void> _saveValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(_counterKey(type), value);
  }

  /// Loads the counter value from persistent storage.
  void loadValue(SharedPreferences preferences) {
    _value = preferences.getInt(_counterKey(type)) ?? 0;
  }

  /// The counter type.
  final CounterType type;

  /// Returns the [Color] value of the current counter.
  Color get color => _counterColors[type]!;

  /// Returns the name of the current counter (e.g. "Red Counter").
  String get name => nameOf(type);

  /// Returns the [Color] value for the specified counter type.
  static Color colorOf(CounterType type) => _counterColors[type]!;

  /// Returns the name of the specified counter type (e.g. "Black Counter").
  static String nameOf(CounterType type) {
    final String name = type.name;
    return '${name[0].toUpperCase()}${name.substring(1).toLowerCase()} Counter';
  }

  /// A map with the corresponding [Color] value for each counter type.
  static const Map<CounterType, Color> _counterColors = {
    CounterType.black: Colors.black,
    CounterType.white: Colors.white,
    CounterType.red: Colors.red,
    CounterType.green: Colors.green,
    CounterType.yellow: Colors.yellow,
    CounterType.blue: Colors.blue,
    CounterType.brown: Colors.brown,
    CounterType.purple: Colors.purple,
    CounterType.pink: Colors.pink,
    CounterType.orange: Colors.orange,
    CounterType.grey: Colors.grey,
  };
}

/// Provides a map of counters for each counter type, and keeps a reference to the current counter.
class Counters {
  /// Creates a Counters instance and creates the counter instances for all counter types.
  Counters() {
    for (var type in CounterType.values) {
      _counters[type] = Counter(type);
    }
  }

  /// The persistent storage key where to keep the current counter type.
  static const String currentCounterKey = 'current_counter';

  /// A map of counters for each counter type.
  final Map<CounterType, Counter> _counters = <CounterType, Counter>{};

  /// The current counter type.
  CounterType _currentType = CounterType.blue;

  /// Returns the current counter.
  Counter get current => _counters[_currentType]!;

  /// Returns the map of counters.
  Counter operator [](CounterType type) => _counters[type]!;

  /// Sets the current counter type.
  set currentType(CounterType type) {
    _currentType = type;
    _saveCurrentType();
  }

  /// Saves the current counter type to persistent storage.
  Future<void> _saveCurrentType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(currentCounterKey, _currentType.index);
  }

  /// Loads counter states from persistent storage.
  Future<void> load() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    /// Load the current counter type, or set the default Blue counter
    final int counterIndex = preferences.getInt(currentCounterKey) ?? CounterType.blue.index;
    _currentType = CounterType.values[counterIndex];

    /// Loads the values of all counters
    for (var counterType in _counters.keys) {
      _counters[counterType]?.loadValue(preferences);
    }
  }
}
