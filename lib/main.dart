// Copyright 2020-2024 Appliberated (https://appliberated.com). All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// @author TechAurelian <dev@techaurelian.com> (https://techaurelian.com)

import 'package:flutter/material.dart';

import 'common/app_strings.dart';
import 'screens/home.dart';

void main() {
  runApp(const HelloWorldCountersApp());
}

/// The app widget.
class HelloWorldCountersApp extends StatelessWidget {
  const HelloWorldCountersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,

      // A black and white theme to go with the app's colored counters
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          surfaceTint: Colors.white,
          primaryContainer: Colors.white,
          onPrimaryContainer: Colors.black,
          outlineVariant: Colors.grey.shade200,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
