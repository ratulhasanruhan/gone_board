import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gone_board/src/main.dart';

void main() {
  test('adds one to input values', () {
    final goneBoard = GoneBoard(
      pageController: PageController(),
      onFinishedPage: Container(),
      items: [],
    );
    expect(goneBoard, isNotNull);
  });
}
