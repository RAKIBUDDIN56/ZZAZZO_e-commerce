import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakibuddin560p/config/routing/route.dart';
import 'package:rakibuddin560p/config/themes/theme.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(Sizer(builder: ((context, orientation, deviceType) {
      return const MyApp();
    })));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      initialRoute: "MainPage",
    );
  }
}
