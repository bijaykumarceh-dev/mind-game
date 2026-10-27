import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mind_twist/main.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Home launches a puzzle and solves a level', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Mind Twist'), findsWidgets);
    expect(find.byKey(const Key('play_button')), findsOneWidget);

    await tester.tap(find.byKey(const Key('play_button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('puzzle_question')), findsOneWidget);

    await tester.tap(find.byKey(const Key('answer_2')));
    await tester.pumpAndSettle();
    expect(find.text('Level Cleared!'), findsOneWidget);
    expect(find.byKey(const Key('next_level_button')), findsOneWidget);
  });
}
