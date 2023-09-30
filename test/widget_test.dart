// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:events/main.dart';

void main() {
  testWidgets('EventApp', (WidgetTester tester) async {
    await tester.pumpWidget(const EventApp());

    expect(find.text('Web Summit'), findsOneWidget);
    expect(find.text('lol'), findsNothing);

    await tester.enterText(find.byKey(const Key('search')), 'CES 2023');

    await tester.tap(find.byKey(const Key('icon')));
    await tester.pump();
    expect(find.text('Web Summit'), findsNothing);
    await tester.pump();
  });
}
