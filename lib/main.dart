import 'ui/screens/details_screen.dart';
import 'ui/screens/home_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Typography.blackRedmond.copyWith(
      labelSmall: TextStyle(
        fontFamily: 'Karla',
        fontWeight: FontWeight.w300,
        letterSpacing: 0.5,
        fontSize: 12,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Karla',
        fontWeight: FontWeight.w300,
        letterSpacing: 0.5,
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Karla',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        fontSize: 14,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Karla',
        letterSpacing: .25,
        wordSpacing: .25,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Karla',
        letterSpacing: .15,
        wordSpacing: .15,
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 40,
      ),
    );

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final lightColorScheme = lightDynamic ??
            ColorScheme.fromSeed(
              seedColor: Color(0xff009fba),
            );
        final darkColorScheme = darkDynamic ??
            ColorScheme.fromSeed(
              seedColor: Color(0xff009fba),
              brightness: Brightness.dark,
            );
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: lightColorScheme,
            textTheme: textTheme.apply(
              displayColor: lightColorScheme.primary,
              bodyColor: lightColorScheme.onPrimaryContainer,
            ),
            useMaterial3: true,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                // elevation: MaterialStateProperty.all<double>(3),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
          ),
          routes: {
            '/': (ctx) => HomePage(),
            '/details': (ctx) => DetailsPage(),
          },
          initialRoute: '/',
        );
      },
    );
  }
}
