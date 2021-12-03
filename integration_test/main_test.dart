import 'package:first_project/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('test tap', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 2));
      final Finder fab = find.byKey(const Key('list_0'));
      await tester.tap(fab);
      await tester.pumpAndSettle();
      expect(find.text('123'), findsWidgets);
    });
  });
}
