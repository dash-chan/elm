import 'package:elm_ui/elm_ui.dart';
import 'package:flutter/material.dart';
import 'package:website/src/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ElementApp(
      title: 'Element App Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
  }
}
