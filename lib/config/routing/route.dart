import 'package:flutter/material.dart';
import 'package:rakibuddin560p/features/view/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => const HomeScreen(),
    };
  }
}
