import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class AndroidViewSurfaceSample {
  static const MethodChannel _channel = MethodChannel('android_view_surface_sample');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

class AndroidViewSurfaceViewPage extends StatelessWidget {
  const AndroidViewSurfaceViewPage({Key? key}) : super(key: key);

  static const String viewType = 'android_view_surface_sample/view';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    return PlatformViewLink(
      viewType: viewType,
      surfaceFactory: (BuildContext context, PlatformViewController controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (PlatformViewCreationParams params) {
        return PlatformViewsService.initSurfaceAndroidView(
          id: params.id,
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }
}
