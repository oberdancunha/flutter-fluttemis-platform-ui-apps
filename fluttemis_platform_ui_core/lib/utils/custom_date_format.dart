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

  factory CustomDateFormat.fromyMdToyMMMMd(String localeName, DateTime date) {
    final dateFormatted = DateFormat.yMMMMd(localeName).format(date);

    return CustomDateFormat._(dateFormatted);
  }

  factory CustomDateFormat.fromyMdToMillisecondsSinceEpoch(DateTime date) {
    final dateFormatted = date.millisecondsSinceEpoch.toString();

    return CustomDateFormat._(dateFormatted);
  }

  String get dateFormatted => _dateFormatted;
}

extension DetectDate on String {
  List<String> get splitByFormat {
    final typesFunctions = {
      // For genbank date, for example like 27-MAY-2021, call _parserDayMonthThreeWordsYear function
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

  // Take the date format as 27-MAY-2021 and return an array with three positions:
  // 0 - day: 27
  // 1 - month in numerical representation: MAY is equal to 05
  // 2 - year: 2021
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
