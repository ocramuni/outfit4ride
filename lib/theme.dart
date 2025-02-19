import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Outfit4RideTheme {
  static TextTheme appTextTheme = TextTheme(
    headlineSmall: GoogleFonts.lato(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black),
    titleLarge: GoogleFonts.lato(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.black),
    titleMedium: GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: Colors.black),
    titleSmall: GoogleFonts.lato(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: Colors.black),
    bodyLarge: GoogleFonts.lato(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: Colors.black),
    bodyMedium: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.black),
    labelLarge: GoogleFonts.lato(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Colors.black),
  );

  static ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light().copyWith(
        primary: Color(0xFF1A265A),
        secondary: Color(0xFFF1600D),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: Color(0xFF1A265A),
        backgroundColor: Color(0xFFA5E9E8),
        titleTextStyle: appTextTheme.titleLarge,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Color(0xFFFEF6ED),
        backgroundColor: Color(0xFF1A265A),
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 22,
            color: Color(0xFF1A265A),
          ),
        ),
        backgroundColor: Color(0xFFA5E9E8),
        indicatorColor: Color(0xFFFEF6ED),
        surfaceTintColor: Colors.transparent,
        indicatorShape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFF1600D), width: 3),
            borderRadius: BorderRadius.circular(16)
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Color(0xFFFEF6ED);
          }
          return Color(0xFF1A265A);
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Color(0xFF1A265A);
          }
          return Color(0xFFFEF6ED);
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Color(0xFF1A265A),
          backgroundColor: Color(0xFFFEF6ED),
          iconColor: Color(0xFFF1600D),
          iconSize: 24,
          shadowColor: Color(0xFF1A265A),
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0)
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            //elevation: WidgetStateProperty.all(10),
            overlayColor: WidgetStateProperty.all(
                Colors.white
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),

            )
          )
      ),
      menuButtonTheme: MenuButtonThemeData(
        style: MenuItemButton.styleFrom(
          textStyle: appTextTheme.headlineSmall,
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: appTextTheme.headlineSmall,
          menuStyle: MenuStyle(
            surfaceTintColor: WidgetStateProperty.all(Color(0xFFFEF6ED)),
              padding: WidgetStateProperty.all(EdgeInsets.all(10)),
              side: WidgetStateProperty.all(BorderSide(
                  color: Color(0xFFF1600D),
                  width: 2.0),
              )
          ),
      ),
      textTheme: appTextTheme,
    );
  }
}
