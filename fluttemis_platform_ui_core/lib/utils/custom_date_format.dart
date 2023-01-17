import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

class CustomDateFormat {
  final String _dateFormatted;

  const CustomDateFormat._(this._dateFormatted);

  factory CustomDateFormat.yMd(String date) {
    final dateSplitted = date.splitByFormat;
    final day = dateSplitted.elementAt(0);
    final month = dateSplitted.elementAt(1);
    final year = dateSplitted.elementAt(2);
    final dateFormatted = '$year-$month-$day';

    return CustomDateFormat._(dateFormatted);
  }

  factory CustomDateFormat.fromyMdToyMMMMd(String localeName, String date) {
    final dateFormatted = DateFormat.yMMMMd(localeName).format(
      DateTime.parse(
        CustomDateFormat.yMd(date).dateFormatted,
      ),
    );

    return CustomDateFormat._(dateFormatted);
  }

  factory CustomDateFormat.fromyMdToMillisecondsSinceEpoch(String date) {
    final dateFormatted =
        DateTime.parse(CustomDateFormat.yMd(date).dateFormatted).millisecondsSinceEpoch.toString();

    return CustomDateFormat._(dateFormatted);
  }

  String get dateFormatted => _dateFormatted;
}

extension DetectDate on String {
  List<String> get splitByFormat {
    final typesFunctions = {
      RegExp(r'\d{2}\-[A-Z]{3}\-\d{4}'): () => _parserDayMonthThreeWordsYear,
    };

    var dayMonthYear = <String>[];
    for (final typeFunction in typesFunctions.keys) {
      if (typeFunction.hasMatch(this)) {
        dayMonthYear = typesFunctions[typeFunction]!();
        break;
      }
    }

    return dayMonthYear;
  }

  List<String> get _parserDayMonthThreeWordsYear {
    final stringToIntMonth = {
      'JAN': 1,
      'FEB': 2,
      'MAR': 3,
      'APR': 4,
      'MAY': 5,
      'JUN': 6,
      'JUL': 7,
      'AUG': 8,
      'SEP': 9,
      'OCT': 10,
      'NOV': 11,
      'DEC': 12,
    };
    final dateSplitted = split('-');
    final day = dateSplitted.elementAt(0);
    final month = dateSplitted.elementAt(1);
    final year = dateSplitted.elementAt(2);

    return [day, stringToIntMonth[month].toString().padLeft(2, '0'), year];
  }
}
