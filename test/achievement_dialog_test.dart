import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/achievements/achievement_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'utils/basic_init.dart';

void main() {
  basicInit();

  testWidgets('AchievementShareRender renders without errors', (WidgetTester tester) async {
    // Create a mock Fragment$Achievement object
    final mockAchievement = Fragment$Achievement(
      id: '1',
      achieved: true,
      title: 'Test Achievement',
      description: 'Description of Test Achievement',
      achievedAt: DateTime.now().toIso8601String(),
      image: 'something.jpg',
    );

    // Build the widget
    await tester.pumpWidget(
      ProviderScope(
        child: AchievementShareRender(
          achievement: mockAchievement,
          imageBytes: kTransparentImage,
        ),
      ),
    );

    // Verify that no errors are thrown
    expect(find.text('Test Achievement'), findsOneWidget);

    // Verify that the image is rendered
    expect(find.byType(Image), findsOneWidget);
  });
}
