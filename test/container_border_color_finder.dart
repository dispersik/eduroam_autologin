import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class ContainerByBorderColorFinder extends MatchFinder {
  ContainerByBorderColorFinder(this.color, {bool skipOffstage = true})
      : super(skipOffstage: skipOffstage);

  final Color color;

  Color _getColorFromString(String string) {
    if (string.contains("Color(0")) {
      var tmp = string.indexOf("Color(0")+'Color('.length;
      String color = string.substring(tmp,tmp+10);
      if (int.tryParse(color)!=null) return Color(int.tryParse(color));
    }
    return null;
  }

  @override
  String get description => 'Container{color: "$color"}';

  @override
  bool matches(Element candidate) {
    if (candidate.widget is Container) {
      final Container containerWidget = candidate.widget as Container;
      if (containerWidget.decoration is BoxDecoration) {
        final BoxDecoration decoration =
        containerWidget.decoration as BoxDecoration;
        // print(decoration);
        // print(_getColorFromString(decoration.toString()));
        return _getColorFromString(decoration.toString()).value == color.value;
        return null;
      }
    }
    return false;
  }
}