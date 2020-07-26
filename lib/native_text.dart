import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class NativeText extends StatelessWidget {
  final String text;
  final bool hybridComposition;

  const NativeText(this.text, {this.hybridComposition = true});

  @override
  Widget build(BuildContext context) {
    const type = 'TextView';
    final creationParams = {'text': text};
    return SizedBox(
      height: 40,
      width: 200,
      child: hybridComposition
          ? PlatformViewLink(
              viewType: type,
              surfaceFactory: (
                BuildContext context,
                PlatformViewController controller,
              ) {
                return AndroidViewSurface(
                  controller: controller as AndroidViewController,
                  gestureRecognizers: const <
                      Factory<OneSequenceGestureRecognizer>>{},
                  hitTestBehavior: PlatformViewHitTestBehavior.opaque,
                );
              },
              onCreatePlatformView: (PlatformViewCreationParams params) {
                return PlatformViewsService.initSurfaceAndroidView(
                  id: params.id,
                  viewType: type,
                  layoutDirection: TextDirection.rtl,
                  creationParams: creationParams,
                  creationParamsCodec: const StandardMessageCodec(),
                )
                  ..addOnPlatformViewCreatedListener(
                      params.onPlatformViewCreated)
                  ..create();
              },
            )
          : AndroidView(
              viewType: type,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
            ),
    );
  }
}
