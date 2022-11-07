import 'fluttemis_app_localizations.dart';

/// The translations for Portuguese (`pt`).
class FluttemisAppLocalizationsPt extends FluttemisAppLocalizations {
  FluttemisAppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get openMenu => 'Abrir navegação';

  @override
  String get closeMenu => 'Fechar navegação';

  @override
  String get genbankFile => 'Genbank file';

  @override
  String filePicker(String fileType, String fileExtensions) {
    return 'Clique para abrir o arquivo $fileType (extensões $fileExtensions)';
  }
}
