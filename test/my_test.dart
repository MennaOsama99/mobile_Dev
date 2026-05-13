import 'package:flutter_test/flutter_test.dart';
import 'package:helloworld/main.dart';

void main() {
  testWidgets('MyApp and MyHomePage widgets test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the 'Hello, World!' text appears on the screen.
    expect(find.text('Hello, World!'), findsOneWidget);

    // Verify that the app bar title is displayed.
    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
  });
}
