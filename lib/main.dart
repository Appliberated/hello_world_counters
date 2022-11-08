// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'common/app_strings.dart';
import 'screens/home.dart';
import 'utils/utils.dart';

void main() {
  runApp(const CountersApp());
}

/// The app widget.
class CountersApp extends StatelessWidget {
  const CountersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.white.createMaterialColor(),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        typography: Typography.material2018(),
      ),
      home: const HomeScreen(),
    );
  }
}
