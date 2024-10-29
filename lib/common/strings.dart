// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/helloworldcounters/license/.

/// App wide UI string constants.
library;

import '../screens/home.dart';

const String appName = 'Hello World Counters';

// -----------------------------------------------------------------------------------------------
// App Drawer
// -----------------------------------------------------------------------------------------------

const String drawerTitle = appName;
const String settingsItemTitle = 'Settings';
const String aboutItemTitle = 'About this Hello World app';
const String viewSourceItemTitle = 'View source code';
const String feedbackItemTitle = 'Send feedback';

const Map<MenuAction, String> menuActions = {
  MenuAction.reset: 'Reset counter',
  MenuAction.share: 'Share...',
};

const String resetConfirm = 'Reset counter to zero?';
const String resetConfirmReset = 'Reset';
const String resetConfirmCancel = 'Cancel';

String shareText(String name, String value) => 'The $name is $value';

// -----------------------------------------------------------------------------------------------
// Home Screen - Main
// -----------------------------------------------------------------------------------------------

const String incrementTooltip = 'Increment';
const String incrementHeroTag = 'incrementHeroTag';
const String decrementTooltip = 'Decrement';
const String decrementHeroTag = 'decrementHeroTag';

// -----------------------------------------------------------------------------------------------
// Settings Screen
// -----------------------------------------------------------------------------------------------

const String settingsTitle = 'Settings';
const String counterTapModeTitle = 'Counter tap mode';
const String counterTapModeSubtitle = 'Tap anywhere to increase counter';
