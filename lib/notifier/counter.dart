// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta/meta.dart';

class CounterRiverpod extends StateNotifier<int> {
  //Declare inital state
  CounterRiverpod() : super(0);
  //Action
  void addCount() => state++;

  //Dispose this
  //Handling user cache etc
  void dispose() {
    super.dispose();
  }
}

final countProvider =
    StateNotifierProvider<CounterRiverpod, int>((ref) => CounterRiverpod());
