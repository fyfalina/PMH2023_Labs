// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:admob_inline_ads_in_flutter/destination.dart';
import 'package:admob_inline_ads_in_flutter/banner_inline_page.dart';
import 'package:admob_inline_ads_in_flutter/home_page.dart';
import 'package:admob_inline_ads_in_flutter/native_inline_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/banner': (context) =>
            BannerInlinePage(entries: Destination.samples),
        '/native': (context) =>
            NativeInlinePage(entries: Destination.samples),
      },
    );
  }
}
