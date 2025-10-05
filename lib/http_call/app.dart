import 'package:flutter/material.dart';
import 'package:flutter_application_1/http_call/screen_with_fetch.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen with Fetch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScreenWithFetch(),
    );
  }
}

