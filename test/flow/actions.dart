import 'package:flutter_test/flutter_test.dart';
import 'package:harry_challenge/models/character.dart';
import '../matchers/matchers.dart';

Future<void> clickOnCharacter(WidgetTester tester) async {
  final characterItem = find.byWidgetPredicate((widget) => characterItemMatcher(widget, 'Harry Potter'));
  expect(characterItem, findsOneWidget);
  return tester.tap(characterItem);
}