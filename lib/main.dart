import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1)),
          useMaterial3: true,
          textTheme: TextTheme(
            displayLarge: GoogleFonts.acme(),
            titleLarge: GoogleFonts.acme(),
            bodyMedium: GoogleFonts.acme(),
            bodyLarge: GoogleFonts.acme(),
            bodySmall: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            labelLarge: GoogleFonts.acme(),
            displayMedium: GoogleFonts.acme(),
            displaySmall: GoogleFonts.acme(),
            headlineMedium: GoogleFonts.acme(),
            headlineSmall: GoogleFonts.acme(),
            titleSmall: GoogleFonts.acme(),
            titleMedium: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            labelSmall: GoogleFonts.acme(),
            labelMedium: GoogleFonts.acme(),
            headlineLarge: GoogleFonts.acme(),
          ),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
