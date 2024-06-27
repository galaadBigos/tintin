import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/providers/reading_list_provider.dart';
import 'package:tintin/screens/albums_master.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ReadingListProvider(),
      child: const MainApp(),
    ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildThemeData(context),
      home: const Scaffold(
        body: AlbumsMater(title: 'Albums')
      ),
    );
  }

  ThemeData _buildThemeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(25, 15, 15, 1),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(240, 65, 50, 1),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      )
    );
  }
}
