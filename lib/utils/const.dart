import 'package:flutter/material.dart';

class Prefs {
  static const tokenPref = 'token';
}

/// demo class for all texts
class Texts {
  const Texts();

  static const title = 'Dumka';
  static const splashTitle = 'Dumka ?';
  static const splashSubtitle = 'зв’язок зі школою та її\nобітатєлями';
  static const proposalsText = 'Пропозиції';
  static const reportsText = 'Розмови';

  static const aboutTitle = 'Про Dumka?';
  static const settingsTitle = 'Налаштування';
  static const accountTitle = 'Обліковий запис';

  static const aboutText = '*тут багато букв про нас*';

  // ignore: avoid_escaping_inner_quotes
  static const aboutFeedBack = 'Зворотній зв\'язок';
  static const aboutSupport = 'Підтримати нас';

  static const settingsLanguage = 'Мова';
  static const settingsTheme = 'Темна тема';

  static const accountStudent = 'учень';
  static const accountTeacher = 'учитель';
  static const accountGeneral = 'Загальні';
  static const accountNetworks = 'Соціальні мережі';
  static const accountNickname = 'Нікнейм';
  static const accountAdd = 'Додати';

  static const approveConfirmButton = 'Підтвердити';
  static const approveDeclineButton = 'Відхилити';
  static const approveDeclineAndReportButton = 'Відхилити та поскаржитись';
}

/// ui styles
class UIConfig {
  const UIConfig();

  /// main color: spinner, fab
  static final primaryColor = Colors.deepPurple[500];
  static final bgColor = Colors.grey[200];
  static Color purple2 = const Color(0xAA651FFF);
  static Color grey = const Color(0xFFF5F5F5);
  static Color purple3 = const Color(0xFF7C4DFF);
  static Color deepPurple300 = const Color(0xFF9575CD);
}

/// data placeholders
class DemoData {
  const DemoData();

  // todo use models
  static const List<String> namesOfProposal = <String>[
    'Більше годин з психологом',
    'Більше годин з психологом',
    'Більше годин з психологом',
    'Більше годин з психологом',
    'Більше годин з психологом',
    'Більше годин з психологом',
    'Більше годин з психологом',
    'Більше годин з психологом',
    'Більше годин з психологом'
  ];

  static const List<int> numberOfComments = <int>[
    5,
    34,
    53,
    63,
    12,
    54,
    63,
    12,
    34
  ];
}
