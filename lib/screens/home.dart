// Copyright 2020-2024 Appliberated (https://appliberated.com). All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// @author TechAurelian <dev@techaurelian.com> (https://techaurelian.com)

import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';

import '../common/app_settings.dart';
import '../common/app_strings.dart';
import '../models/counter.dart';
import '../utils/utils.dart';
import '../widgets/accept_cancel_dialog.dart';
import '../widgets/counter_display.dart';
import '../widgets/counters_drawer.dart';
import 'settings_screen.dart';

/// Overflow menu items enumeration.
enum MenuAction { reset, share }

/// The app home screen widget.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// The logic and internal state for the app home screen widget.
class _HomeScreenState extends State<HomeScreen> {
  /// The map of counters for each counter type.
  final Counters _counters = Counters();

  /// The current app settings.
  final AppSettings _appSettings = AppSettings();

  @override
  void initState() {
    super.initState();
    _loadCounters();
  }

  /// Loads counter values from persistent storage.
  Future<void> _loadCounters() async {
    await _counters.load();
    await _appSettings.load();
    setState(() {});
  }

  /// Select and display the specified counter when its drawer list tile is tapped.
  void _onDrawerSelected(CounterType counterType) {
    setState(() => _counters.currentType = counterType);
    Navigator.pop(context);
  }

  /// Performs the tasks of the popup menu items (reset, share, rate, and help).
  void popupMenuSelection(MenuAction item) {
    switch (item) {
      case MenuAction.reset:
        // Reset the counter after asking for confirmation.
        showAcceptCancelDialog(
          context,
          AppStrings.resetConfirm,
          AppStrings.resetConfirmReset,
          AppStrings.resetConfirmCancel,
          () => setState(() => _counters.current.reset()),
        );
        break;
      case MenuAction.share:
        // Share the current counter value using the platform's share sheet.
        final String name = _counters.current.name;
        final String value = toDecimalString(context, _counters.current.value);
        Share.share(AppStrings.shareText(name, value), subject: name);
        break;
    }
  }

  void _onDrawerExtraSelected(DrawerExtraActions item) {
    switch (item) {
      case DrawerExtraActions.settings:
        // Load the Settings screen
        _loadSettingsScreen();
        break;
      case DrawerExtraActions.help:
        // Launch the app online help url
        launchUrlExternal(context, AppStrings.helpURL);
        break;
      case DrawerExtraActions.rate:
        // Launch the Google Play Store page to allow the user to rate the app
        launchUrlExternal(context, AppStrings.rateAppURL);
        break;
      case DrawerExtraActions.viewSource:
        // Launch the app source code repo url
        launchUrlExternal(context, AppStrings.viewSourceURL);
        break;
    }
  }

  /// Navigates to the Settings screen, and refreshes on return.
  Future<void> _loadSettingsScreen() async {
    await Navigator.push<void>(context,
        MaterialPageRoute(builder: (context) => SettingsScreen(appSettings: _appSettings)));
    setState(() {
      /* Refresh after returning from Settings screen. */
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).size.height >= 500;

    final CounterDisplay counterDisplay = CounterDisplay(
      value: _counters.current.value,
      color: _counters.current.color,
      isPortrait: isPortrait,
    );

    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _appSettings.counterTapMode
          ? GestureDetector(
              onTap: () => setState(() => _counters.current.increment()),
              child: counterDisplay,
            )
          : counterDisplay,
      floatingActionButton: !(_appSettings.counterTapMode) ? _buildFABs(isPortrait) : null,
    );
  }

  /// Builds the app bar with the popup menu items.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(_counters.current.name),
      actions: <Widget>[
        PopupMenuButton<MenuAction>(
          onSelected: popupMenuSelection,
          itemBuilder: _buildMenuItems,
        ),
      ],
    );
  }

  /// Builds the popup menu items for the app bar.
  List<PopupMenuItem<MenuAction>> _buildMenuItems(BuildContext context) {
    return MenuAction.values
        .map(
          (item) => PopupMenuItem<MenuAction>(
            value: item,
            enabled: !(item == MenuAction.reset && _counters.current.value == 0),
            child: Text(AppStrings.menuActions[item]!),
          ),
        )
        .toList();
  }

  /// Builds the main drawer that lets the user switch between color counters.
  Widget _buildDrawer() {
    return CountersDrawer(
      title: AppStrings.drawerTitle,
      counters: _counters,
      onSelected: _onDrawerSelected,
      onExtraSelected: _onDrawerExtraSelected,
    );
  }

  /// Builds the two main floating action buttons for increment and decrement.
  Widget _buildFABs(bool isPortrait) {
    return Flex(
      direction: isPortrait ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: AppStrings.decrementHeroTag,
          onPressed: () => setState(() => _counters.current.decrement()),
          tooltip: AppStrings.decrementTooltip,
          child: const Icon(Icons.remove),
        ),
        isPortrait ? const SizedBox(height: 16.0) : const SizedBox(width: 16.0),
        FloatingActionButton(
          heroTag: AppStrings.incrementHeroTag,
          onPressed: () => setState(() => _counters.current.increment()),
          tooltip: AppStrings.incrementTooltip,
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}
