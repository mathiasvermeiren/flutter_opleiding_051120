import 'package:flutter/material.dart';
import 'package:flutter_opleiding_051120/navigation/route_generator.dart';
import 'package:flutter_opleiding_051120/pages/home_page.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(HaxxApp());
}

class HaxxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: HexColor("#5B6770"),
        primaryColorLight: HexColor("#D0D1D2"),
        primaryColorDark: HexColor("#515151"),
        accentColor: HexColor("#E9531D"),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
