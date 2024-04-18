import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AutoDisposeRefX<T> on AutoDisposeRef<T> {
  void delayDispose(Duration duration) {
    final link = keepAlive();
    Timer? timer;

    onCancel(() {
      timer?.cancel();
      timer = Timer(duration, link.close);
    });
    onResume(() => timer?.cancel());
    onDispose(() => timer?.cancel());
  }
}
