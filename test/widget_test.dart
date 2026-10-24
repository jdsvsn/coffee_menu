import 'package:flutter_test/flutter_test.dart';

import 'package:coffee_menu/main.dart';

void main() {
  testWidgets('Menu shows cafe name', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Brew & Bean Cafe'), findsOneWidget);
  });
}
