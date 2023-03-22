import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/cupertino.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

Widget scroll({required ScrollController controller, required Widget child}) {
  if (kIsWeb) {
    return WebSmoothScroll(controller: controller, child: child);
  }
  return child;
}

const physics = kIsWeb ? NeverScrollableScrollPhysics() : null;
