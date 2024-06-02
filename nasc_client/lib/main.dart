import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasc_client/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
          titleLarge: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontSize: 17,
            fontWeight: FontWeight.w900,
            color: Colors.black87,
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 20,
            color: Colors.white,
          ),
          /*  bodyMedium: GoogleFonts.montserrat(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ), */
        ),
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          color: Colors.lime.shade50,
          margin: const EdgeInsets.all(33),
        ),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/municipalities': (context) =>
            const MunicipalityPage(), // 'municipalities' is not a valid route
        '/citizen': (context) => const CitizenPage(),
        '/land_owners': (context) => const LandOwnersPage(),
        '/investors': (context) => const InvestorsPage(),
      },
    );
  }
}
