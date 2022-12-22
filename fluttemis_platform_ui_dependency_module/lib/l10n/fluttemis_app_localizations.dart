import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'fluttemis_app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of FluttemisAppLocalizations
/// returned by `FluttemisAppLocalizations.of(context)`.
///
/// Applications need to include `FluttemisAppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/fluttemis_app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: FluttemisAppLocalizations.localizationsDelegates,
///   supportedLocales: FluttemisAppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the FluttemisAppLocalizations.supportedLocales
/// property.
abstract class FluttemisAppLocalizations {
  FluttemisAppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FluttemisAppLocalizations? of(BuildContext context) {
    return Localizations.of<FluttemisAppLocalizations>(context, FluttemisAppLocalizations);
  }

  static const LocalizationsDelegate<FluttemisAppLocalizations> delegate = _FluttemisAppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('pt')
  ];

  /// No description provided for @mainMenu.
  ///
  /// In pt, this message translates to:
  /// **'Menu principal'**
  String get mainMenu;

  /// No description provided for @openFile.
  ///
  /// In pt, this message translates to:
  /// **'Abrir arquivo'**
  String get openFile;

  /// No description provided for @genbankDescription.
  ///
  /// In pt, this message translates to:
  /// **'Um arquivo genbank é composto por sequências de nucleotídeos, informações do organismo de origem e suas anotações, como CDS, rRNA e gene.'**
  String get genbankDescription;

  /// No description provided for @toolAcceptedExtensions.
  ///
  /// In pt, this message translates to:
  /// **'Extensões aceitas: '**
  String get toolAcceptedExtensions;

  /// No description provided for @fileEmpty.
  ///
  /// In pt, this message translates to:
  /// **'Erro na leitura do arquivo: arquivo vazio'**
  String get fileEmpty;

  /// No description provided for @fileFormatError.
  ///
  /// In pt, this message translates to:
  /// **'Erro na leitura do arquivo: formato desconhecido'**
  String get fileFormatError;

  /// No description provided for @fileNotFound.
  ///
  /// In pt, this message translates to:
  /// **'Erro na leitura do arquivo: arquivo não encontrado'**
  String get fileNotFound;

  /// No description provided for @fileUnexpectedError.
  ///
  /// In pt, this message translates to:
  /// **'Erro na leitura do arquivo: erro não esperado'**
  String get fileUnexpectedError;

  /// No description provided for @nextOptionInError.
  ///
  /// In pt, this message translates to:
  /// **'Escolha uma das opções a seguir'**
  String get nextOptionInError;

  /// No description provided for @backTo.
  ///
  /// In pt, this message translates to:
  /// **'Voltar para o'**
  String get backTo;

  /// No description provided for @goToMenu.
  ///
  /// In pt, this message translates to:
  /// **'Ir para o menu'**
  String get goToMenu;

  /// No description provided for @menuDescription.
  ///
  /// In pt, this message translates to:
  /// **'Caso queira desistir de usar a ferramenta escolhida, você pode acessar diretamente o menu principal do sistema.'**
  String get menuDescription;

  /// No description provided for @tryMessage.
  ///
  /// In pt, this message translates to:
  /// **'Tentar'**
  String get tryMessage;

  /// No description provided for @again.
  ///
  /// In pt, this message translates to:
  /// **'Novamente'**
  String get again;

  /// No description provided for @tryAgain.
  ///
  /// In pt, this message translates to:
  /// **'Tentar novamente'**
  String get tryAgain;

  /// No description provided for @tryAgainDescription.
  ///
  /// In pt, this message translates to:
  /// **'Caso desconfie de que o erro tenha acontecido por alguma instabilidade do momento, você pode tentar realizar essa tarefa novamente.'**
  String get tryAgainDescription;

  /// No description provided for @fileReading.
  ///
  /// In pt, this message translates to:
  /// **'Lendo dados do arquivo'**
  String get fileReading;

  /// No description provided for @apiReading.
  ///
  /// In pt, this message translates to:
  /// **'Lendo dados da API'**
  String get apiReading;

  /// No description provided for @quicklyAccess.
  ///
  /// In pt, this message translates to:
  /// **'Acesso rápido'**
  String get quicklyAccess;

  /// No description provided for @productColorLabel.
  ///
  /// In pt, this message translates to:
  /// **'Legenda de cores pelo tipo do produto'**
  String get productColorLabel;

  /// No description provided for @genomeOverview.
  ///
  /// In pt, this message translates to:
  /// **'Dados gerais do genoma'**
  String get genomeOverview;

  /// No description provided for @genomeFileName.
  ///
  /// In pt, this message translates to:
  /// **'Nome do arquivo'**
  String get genomeFileName;

  /// No description provided for @genomeApiName.
  ///
  /// In pt, this message translates to:
  /// **'Endereço da API'**
  String get genomeApiName;

  /// No description provided for @genomeCodeAccession.
  ///
  /// In pt, this message translates to:
  /// **'Código de acesso de anotação do genoma'**
  String get genomeCodeAccession;

  /// No description provided for @genomeLength.
  ///
  /// In pt, this message translates to:
  /// **'Quantidade de bases de dna do genoma'**
  String get genomeLength;

  /// No description provided for @genomeType.
  ///
  /// In pt, this message translates to:
  /// **'Tipo de genoma'**
  String get genomeType;

  /// No description provided for @genomeShape.
  ///
  /// In pt, this message translates to:
  /// **'Forma do genoma'**
  String get genomeShape;

  /// No description provided for @annotationDate.
  ///
  /// In pt, this message translates to:
  /// **'Data em que a anotação tornou-se pública'**
  String get annotationDate;

  /// No description provided for @locusOverview.
  ///
  /// In pt, this message translates to:
  /// **'Dados gerais dos locus'**
  String get locusOverview;

  /// No description provided for @totalLocus.
  ///
  /// In pt, this message translates to:
  /// **'Total de locus'**
  String get totalLocus;

  /// No description provided for @totalTypeLocus.
  ///
  /// In pt, this message translates to:
  /// **'Total de tipos de locus'**
  String get totalTypeLocus;

  /// No description provided for @countTypeLocus.
  ///
  /// In pt, this message translates to:
  /// **'Total de locus por tipo'**
  String get countTypeLocus;

  /// No description provided for @productsOverview.
  ///
  /// In pt, this message translates to:
  /// **'Dados gerais dos produtos'**
  String get productsOverview;

  /// No description provided for @totalTypeProducts.
  ///
  /// In pt, this message translates to:
  /// **'Total de tipos de produtos'**
  String get totalTypeProducts;

  /// No description provided for @countProductLocus.
  ///
  /// In pt, this message translates to:
  /// **'Total de produtos por tipo'**
  String get countProductLocus;
}

class _FluttemisAppLocalizationsDelegate extends LocalizationsDelegate<FluttemisAppLocalizations> {
  const _FluttemisAppLocalizationsDelegate();

  @override
  Future<FluttemisAppLocalizations> load(Locale locale) {
    return SynchronousFuture<FluttemisAppLocalizations>(lookupFluttemisAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_FluttemisAppLocalizationsDelegate old) => false;
}

FluttemisAppLocalizations lookupFluttemisAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'pt': return FluttemisAppLocalizationsPt();
  }

  throw FlutterError(
    'FluttemisAppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
