import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasc_client/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Natural Asset Smart Contracts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.light,
          background: Colors.black,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme().copyWith(
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleLarge: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          color: Colors.lime.shade50,
          margin: const EdgeInsets.all(33),
        ),
      ),
      home: const HomePage(),
    );
  }
}
