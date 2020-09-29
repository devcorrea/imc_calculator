import "package:flutter/material.dart";
import "../home/home_page.dart";

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      home: Home(),
    );
  }
}
