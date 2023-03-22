import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class RawImageProvider extends ImageProvider<RawImageProvider> {
  const RawImageProvider(this.bytes, {this.scale = 1.0});

  final Uint8List bytes;
  final double scale;

  @override
  Future<RawImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<RawImageProvider>(this);
  }

  @override
  ImageStreamCompleter loadBuffer(
      RawImageProvider key, DecoderBufferCallback decode) {
    return OneFrameImageStreamCompleter(_loadAsync());
  }

  Future<ImageInfo> _loadAsync() async {
    final codec = await instantiateImageCodec(bytes);
    final frameInfo = await codec.getNextFrame();
    return ImageInfo(image: frameInfo.image, scale: scale);
  }
}
