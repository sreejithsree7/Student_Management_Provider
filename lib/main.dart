import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:student_data_prov/splash/screen_splash.dart';

import 'condroller/provider/constants.dart';
import 'view/add_student/screen_add_student.dart';
import 'view/home/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white)),
        ),
        initialRoute: '/home',
        routes: {
          '/': (_) => const ScreenSplash(),
          '/home': (_) => const ScreenHome(),
          '/addStudent': (_) => ScreenAddStudent(),
          // '/viewStudent': (context) => ScreenViewStudent()
        },
      ),
    );
  }
}
