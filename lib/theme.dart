import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_app/models/radio_tile_style.dart';

const primaryColor = Color.fromARGB(255, 178, 224, 30);
const secondaryColor = Color.fromARGB(255, 200, 187, 243);
const tertiaryColor = Color.fromARGB(255, 229, 191, 41);
const darkColor = Color.fromARGB(255, 75, 71, 71);
const surfaceDimColor = Color.fromARGB(255, 237, 237, 237);

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: primaryColor,
  primary: primaryColor,
  onPrimary: Colors.white,
  secondary: secondaryColor,
  onSecondary: Colors.white,
  tertiary: tertiaryColor,
  surfaceDim: const Color.fromARGB(255, 237, 236, 236),
  surface: Colors.white,
  surfaceContainerLowest: surfaceDimColor,
  surfaceContainerLow: Color.lerp(Colors.white, surfaceDimColor, 0.5),
  surfaceContainer: Colors.white,
  surfaceContainerHigh: Color.lerp(Colors.white, surfaceDimColor, 0.5),
  surfaceContainerHighest: surfaceDimColor,
  surfaceTint: Colors.white,
  scrim: darkColor.withAlpha(25),
);

final textTheme = GoogleFonts.interTextTheme().apply(
  bodyColor: darkColor,
  displayColor: darkColor,
);
final darkTextStyle = textTheme.bodyMedium!.copyWith(color: darkColor);
final titleTextStyle = textTheme.titleLarge!.copyWith(
  fontSize: 36.0,
  fontWeight: FontWeight.w600,
);
final linkTextStyle = textTheme.bodyMedium!.copyWith(
  color: primaryColor,
  decoration: TextDecoration.underline,
  decorationColor: primaryColor,
);
final primaryTitleTextStyle = textTheme.titleLarge!.copyWith(
  fontSize: 30.0,
  fontWeight: FontWeight.w600,
  color: primaryColor,
);
final secondaryTitleTextStyle = textTheme.titleLarge!.copyWith(
  fontSize: 30.0,
  fontWeight: FontWeight.w600,
  color: secondaryColor,
);

const iconTheme = IconThemeData(color: darkColor);
const darkIconTheme = IconThemeData(color: darkColor);

final primaryButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.primary,
  foregroundColor: colorScheme.onPrimary,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
);
final smallPrimaryButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.primary,
  foregroundColor: colorScheme.onPrimary,
  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
);
final iconPrimaryButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.primary,
  foregroundColor: colorScheme.onPrimary,
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
  minimumSize: const Size(36.0, 36.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
);
final primaryOutlinedButton = OutlinedButton.styleFrom(
  foregroundColor: darkColor,
  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  side: const BorderSide(color: primaryColor, width: 1.0),
  textStyle: textTheme.bodyMedium,
);
final secondaryButton = FilledButton.styleFrom( 
  backgroundColor: colorScheme.secondary,
  foregroundColor: colorScheme.onSecondary,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
);
final tertiaryOutlinedButton = OutlinedButton.styleFrom(
  foregroundColor: tertiaryColor,
  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  side: const BorderSide(color: tertiaryColor, width: 1.0),
  textStyle: textTheme.bodyMedium!.copyWith(color: tertiaryColor),
);
final backgroundButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.surface,
  foregroundColor: colorScheme.onSurface,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
);
final onBackgroundButton = FilledButton.styleFrom(
  backgroundColor: colorScheme.surfaceDim,
  foregroundColor: darkColor,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 36.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  side: BorderSide.none,
);
final darkButton = FilledButton.styleFrom(
  backgroundColor: darkColor,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 36.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
);
final darkOutlinedButton = OutlinedButton.styleFrom(
  foregroundColor: darkColor,
  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 36.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
);

final primaryRadioTileStyle = RadioTileStyle(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  normalColor: colorScheme.surfaceDim,
  selectedColor: colorScheme.surfaceDim.withAlpha(0),
  radioColor: primaryColor,
  textStyle: darkTextStyle,
  selectedTextStyle: darkTextStyle,
  iconTheme: darkIconTheme,
  selectedIconTheme: darkIconTheme,
  shape: RoundedRectangleBorder(
    side: const BorderSide(
      color: primaryColor,
      width: 0.0,
      style: BorderStyle.none,
      strokeAlign: BorderSide.strokeAlignInside,
    ),
    borderRadius: BorderRadius.circular(20.0),
  ),
  selectedShape: RoundedRectangleBorder(
    side: const BorderSide(
      color: primaryColor,
      width: 6.0,
      style: BorderStyle.solid,
      strokeAlign: BorderSide.strokeAlignInside,
    ),
    borderRadius: BorderRadius.circular(20.0),
  ),
);
final primaryFilledRadioStyle = RadioTileStyle(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  normalColor: colorScheme.surfaceDim,
  selectedColor: primaryColor,
  radioColor: primaryColor,
  textStyle: darkTextStyle,
  selectedTextStyle: darkTextStyle.copyWith(color: Colors.white),
  iconTheme: darkIconTheme,
  selectedIconTheme: darkIconTheme.copyWith(color: Colors.white),
  shape: RoundedRectangleBorder(
    side: const BorderSide(
      color: primaryColor,
      width: 0.0,
      style: BorderStyle.none,
      strokeAlign: BorderSide.strokeAlignInside,
    ),
    borderRadius: BorderRadius.circular(20.0),
  ),
  selectedShape: RoundedRectangleBorder(
    side: const BorderSide(style: BorderStyle.none),
    borderRadius: BorderRadius.circular(20.0),
  ),
);
final secondaryRadioTileStyle = RadioTileStyle(
  padding: const EdgeInsets.all(8.0),
  normalColor: colorScheme.surfaceDim,
  selectedColor: secondaryColor,
  radioColor: darkColor,
  textStyle: darkTextStyle,
  selectedTextStyle: darkTextStyle.copyWith(color: Colors.white),
  iconTheme: darkIconTheme,
  selectedIconTheme: iconTheme.copyWith(color: Colors.white),
  shape: RoundedRectangleBorder(
    side: const BorderSide(style: BorderStyle.none),
    borderRadius: BorderRadius.circular(20.0),
  ),
  selectedShape: RoundedRectangleBorder(
    side: const BorderSide(style: BorderStyle.none),
    borderRadius: BorderRadius.circular(20.0),
  ),
);

final primaryInputDecoration = InputDecorationTheme(
  filled: true,
  fillColor: colorScheme.surfaceDim,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0),
    borderSide: BorderSide.none,
  ),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 16.0,
  ),
);
final outlinedPrimaryInputDecoration = InputDecorationTheme(
  filled: true,
  fillColor: colorScheme.surface,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0),
    borderSide: BorderSide(
      color: colorScheme.primary,
      width: 5.0,
      strokeAlign: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0),
    borderSide: BorderSide(
      color: colorScheme.primary,
      width: 5.0,
      strokeAlign: 1.0,
    ),
  ),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 16.0,
  ),
);
final searchInputDecoration = const InputDecoration(
  prefixIcon: Icon(Icons.search),
).applyDefaults(primaryInputDecoration);

final themeData = ThemeData(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.white,
  textTheme: textTheme,
  iconTheme: iconTheme,
  appBarTheme: AppBarTheme(
    titleTextStyle: textTheme.titleLarge?.copyWith(
      color: colorScheme.primary,
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: darkColor),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: primaryInputDecoration,
  ),
  filledButtonTheme: FilledButtonThemeData(style: primaryButton),
  inputDecorationTheme: primaryInputDecoration,
  dialogTheme: DialogTheme(
    backgroundColor: colorScheme.surface,
    contentTextStyle: textTheme.bodyMedium,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedItemColor: darkColor,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: colorScheme.surfaceDim,
    selectedColor: primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
      side: BorderSide.none,
    ),
    checkmarkColor: colorScheme.onPrimary,
    side: BorderSide.none,
  ),
  sliderTheme: SliderThemeData(
    valueIndicatorColor: colorScheme.surfaceDim,
  ),
  extensions: [primaryRadioTileStyle],
);
