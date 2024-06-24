import 'dart:async';

import 'package:flutter/material.dart';

class AppDebouncer {
  final Duration delay;
  Timer? _timer;

  AppDebouncer(this.delay);

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void cancel() {
    _timer?.cancel();
  }
}