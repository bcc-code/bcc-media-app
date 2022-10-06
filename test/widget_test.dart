// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:brunstadtv_app/screens/home/home.dart';
import 'package:brunstadtv_app/sections.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: const HomeScreen(),
        navigatorObservers: [mockObserver],
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('Hei1'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    expect(find.byElementType(ItemWidget), findsOneWidget);
    await tester.tap(find.byElementType(ItemWidget));
    await tester.pumpAndSettle();

    /// Verify that a push event happened
    verify(mockObserver.didPush(any as Route<dynamic>, null));
  });
}
