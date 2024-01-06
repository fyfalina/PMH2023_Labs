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

// TODO: Import ad_helper.dart
import 'package:admob_inline_ads_in_flutter/ad_helper.dart';

import 'package:admob_inline_ads_in_flutter/destination.dart';
// TODO: Import google_mobile_ads.dart
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter/material.dart';

class NativeInlinePage extends StatefulWidget {
  final List<Destination> entries;

  const NativeInlinePage({
    required this.entries,
    super.key,
  });

  @override
  State createState() => _NativeInlinePageState();
}

class _NativeInlinePageState extends State<NativeInlinePage> {
  // TODO: Add _kAdIndex
  static const _kAdIndex = 4;

  // TODO: Add a native ad instance
  NativeAd? _ad;

  @override
  void initState() {
    super.initState();

    // TODO: Load a native ad
    _ad = NativeAd(
      adUnitId: AdHelper.nativeAdUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _ad = ad as NativeAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    _ad?.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdMob Native Inline Ad'),
      ),
      body: ListView.builder(
        // TODO: Adjust itemCount based on the ad load state
        itemCount: widget.entries.length + (_ad != null ? 1 : 0),
        itemBuilder: (context, index) {
          // TODO: Render a native ad
          if (_ad != null && index == _kAdIndex) {
            return Container(
              height: 72.0,
              alignment: Alignment.center,
              child: AdWidget(ad: _ad!),
            );
          } else {
            // TODO: Get adjusted item index from _getDestinationItemIndex()
            final item = widget.entries[_getDestinationItemIndex(index)];

            return ListTile(
              leading: Image.asset(
                item.asset,
                width: 48,
                height: 48,
                package: 'flutter_gallery_assets',
                fit: BoxFit.cover,
              ),
              title: Text(item.name),
              subtitle: Text(item.duration),
              onTap: () {
                debugPrint('Clicked ${item.name}');
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: Dispose a NativeAd object
    _ad?.dispose();

    super.dispose();
  }

// TODO: Add _getDestinationItemIndex()
  int _getDestinationItemIndex(int rawIndex) {
    if (rawIndex >= _kAdIndex && _ad != null) {
      return rawIndex - 1;
    }
    return rawIndex;
  }
}
