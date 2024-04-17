// Copyright 2020-2024 Appliberated (https://appliberated.com). All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// @author TechAurelian <dev@techaurelian.com> (https://techaurelian.com)

import '../screens/home.dart';

/// Application wide UI and URL string constants.
class AppStrings {
  static const String appName = 'Hello World Counters';

  // -----------------------------------------------------------------------------------------------
  // App Drawer
  // -----------------------------------------------------------------------------------------------

  static const String drawerTitle = appName;
  static const String settingsItemTitle = 'Settings';
  static const String aboutItemTitle = 'About This App';
  static const String rateItemTitle = 'Rate App';
  static const String viewSourceItemTitle = 'View Source Code';

  static const Map<MenuAction, String> menuActions = {
    MenuAction.reset: 'Reset counter',
    MenuAction.share: 'Share...',
  };

  static const String resetConfirm = 'Reset counter to zero?';
  static const String resetConfirmReset = 'Reset';
  static const String resetConfirmCancel = 'Cancel';

  static String shareText(String name, String value) => 'The $name is $value';

  static const String rateAppURL = 'https://appliberated.com/helloworldcounters/rate/';

  static const String aboutURL = 'https://appliberated.com/helloworldcounters/';

  static const String viewSourceURL = 'https://github.com/Appliberated/hello_world_counters';

  // -----------------------------------------------------------------------------------------------
  // Home Screen - Main
  // -----------------------------------------------------------------------------------------------

  static const String incrementTooltip = 'Increment';
  static const String incrementHeroTag = 'incrementHeroTag';
  static const String decrementTooltip = 'Decrement';
  static const String decrementHeroTag = 'decrementHeroTag';

  // -----------------------------------------------------------------------------------------------
  // Settings Screen
  // -----------------------------------------------------------------------------------------------

  static const String settingsTitle = 'Settings';
  static const String counterTapModeTitle = 'Counter tap mode';
  static const String counterTapModeSubtitle = 'Tap anywhere to increase counter';
}
