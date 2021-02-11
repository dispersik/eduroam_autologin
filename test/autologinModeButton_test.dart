import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'container_border_color_finder.dart';

import 'package:eduroam_autologin/front/widgets/autologinModeButton.dart';
import 'package:eduroam_autologin/front/ui_globals.dart';

void main() {
  testWidgets(
      '[autologinModeButton] has a correctly painted container with title in enabled state',
      (WidgetTester tester) async {
    //Build MaterialApp with [AutologinModeButton] in activated mode
    await tester.pumpWidget(MaterialApp(
        home:
            Scaffold(body: AutologinModeButton(onPressed: null, mode: true))));
    // Find the [AutologinModeButton] title
    final titleFinder = find.text('Автологин включен');
    expect(titleFinder, findsOneWidget);
    //Find the [AutologinModeButton] color
    final colorFinder = ContainerByBorderColorFinder(enabledColor);
    expect(colorFinder, findsOneWidget);
  });

  testWidgets(
      '[autologinModeButton] has a correctly painted container with title in disabled state',
      (WidgetTester tester) async {
    //Build MaterialApp with [AutologinModeButton] in deactivated mode
    await tester.pumpWidget(MaterialApp(
        home:
            Scaffold(body: AutologinModeButton(onPressed: null, mode: false))));
    // Find the [AutologinModeButton] title
    final titleFinder = find.text('Автологин отключен');
    expect(titleFinder, findsOneWidget);
    //Find the [AutologinModeButton] color
    final colorFinder = ContainerByBorderColorFinder(disabledColor);
    expect(colorFinder, findsOneWidget);
  });
}
