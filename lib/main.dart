// Copyright 2020-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/helloworldcounters/license/.

import 'package:flutter/material.dart';

import 'common/strings.dart' as strings;
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
      title: strings.appName,

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
