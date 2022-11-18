import 'fluttemis_app_localizations.dart';

/// The translations for Portuguese (`pt`).
class FluttemisAppLocalizationsPt extends FluttemisAppLocalizations {
  FluttemisAppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get mainMenu => 'Menu principal';

  @override
  String get openFile => 'Abrir arquivo';

  @override
  String get genbankDescription => 'Um arquivo genbank é composto por sequências de nucleotídeos, informações do organismo de origem e suas anotações, como CDS, rRNA e gene';

  @override
  String get toolAcceptedExtensions => 'Extensões aceitas: ';
}
