// Copyright 2020-2024 Appliberated (https://appliberated.com). All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// @author TechAurelian <dev@techaurelian.com> (https://techaurelian.com)

import 'package:flutter/material.dart';

import '../common/app_strings.dart';
import '../models/counter.dart';
import '../utils/utils.dart';
import 'color_list_tile.dart';

/// Drawer extra actions enumeration.
enum DrawerExtraActions { settings, about, rate, viewSource }

/// A material design drawer that shows navigation links for all available counters.
class CountersDrawer extends StatelessWidget {
  /// Creates a counters drawer widget.
  const CountersDrawer({
    super.key,
    required this.title,
    required this.counters,
    required this.onSelected,
    this.onExtraSelected,
  });

  /// The title of the drawer displayed in the drawer header.
  final String title;

  /// The map of counters.
  final Counters counters;

  /// Called when the user taps a drawer list tile.
  final void Function(CounterType value) onSelected;

  /// Called when the user taps a drawer list tile.
  final void Function(DrawerExtraActions value)? onExtraSelected;

  void _onExtraActionTap(BuildContext context, DrawerExtraActions action) {
    Navigator.pop(context);
    onExtraSelected?.call(action);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListTileTheme(
        selectedColor: Colors.black,
        child: ListView(
          children: <Widget>[
            _buildDrawerHeader(context),
            ...CounterType.values.map((type) => _buildCounterListTile(context, type)),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(AppStrings.settingsItemTitle),
              onTap: () => _onExtraActionTap(context, DrawerExtraActions.settings),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text(AppStrings.aboutItemTitle),
              onTap: () => _onExtraActionTap(context, DrawerExtraActions.about),
            ),
            ListTile(
              leading: const Icon(Icons.flutter_dash),
              title: const Text(AppStrings.viewSourceItemTitle),
              onTap: () => _onExtraActionTap(context, DrawerExtraActions.viewSource),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.stars),
              title: const Text(AppStrings.rateItemTitle),
              onTap: () => _onExtraActionTap(context, DrawerExtraActions.rate),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 8.0,
      child: DrawerHeader(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

  Widget _buildCounterListTile(BuildContext context, CounterType counterType) {
    return ColorListTile(
      color: Counter.colorOf(counterType),
      title: Counter.nameOf(counterType),
      subtitle: toDecimalString(context, counters[counterType].value),
      selected: counterType == counters.current.type,
      onTap: () => onSelected(counterType),
    );
  }
}
