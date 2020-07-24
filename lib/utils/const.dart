import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Text
const TITLE = "Dumka";
const SPLASH_TITLE = "Dumka ?";
const SPLASH_TEXT = "зв’язок зі школою та її\nобітатєлями";
const PROPOSALS_TEXT = "Пропозиції";
const REPORTS_TEXT = "Скарги";

// Colors
const fabColor = Color(0xFF5447BD);
const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

//Arrays of data
  final List<String> namesOfProposal = <String>[
    "Більше годин з психологом",
    "Більше годин з психологом",
    "Більше годин з психологом",
    "Більше годин з психологом",
    "Більше годин з психологом",
    "Більше годин з психологом",
    "Більше годин з психологом",
    "Більше годин з психологом",
    "Більше годин з психологом"
  ];
  final List<int> numberOfComments = <int>[5, 34, 53, 63, 12, 54, 63, 12, 34];