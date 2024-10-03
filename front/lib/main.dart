import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'Login/LoginPage.dart'; // Importa el archivo LoginPage.dart que contiene la vista de inicio de sesión.
import 'view/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  _MyAppState createState() => _MyAppState();
  } 

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(useMaterial3: true),
        home: const LoginPage(), //  pantalla de inicio LoginPage.
      ),
    );
  }
}
