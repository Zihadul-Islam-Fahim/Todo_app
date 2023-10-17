import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() => runApp(const Todos());

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  ThemeMode Thememode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dialogBackgroundColor: Colors.amber[300],
        primarySwatch: Colors.amber,
        canvasColor: Colors.amber[100],
        appBarTheme: AppBarTheme(backgroundColor: Colors.amber[300]),
        cardColor: Colors.amber[300],
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.amber[300]),
      ),
      darkTheme: ThemeData(
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.deepPurple[400]),
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData( style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple)),),
        canvasColor: Colors.deepPurple[700],
        cardColor: Colors.deepPurple[400],
        primaryColor: Colors.deepPurple,
        appBarTheme: AppBarTheme(color: Colors.deepPurple[400]),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          iconSize: 30,
          backgroundColor: Colors.deepPurple[400],
          splashColor: Colors.red,
        ),
      ),
      themeMode: Thememode,
      home: HomeScreen(
        mode: Thememode,
        callbackThemeChange: changeTheme,
      ),
    );
  }

  changeTheme(ThemeMode thememode) {
    setState(() {
      Thememode = thememode;
    });
  }
}
