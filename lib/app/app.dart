import 'package:flutter/material.dart';

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Quran App'),
        ),
      ),
    );
  }
}
