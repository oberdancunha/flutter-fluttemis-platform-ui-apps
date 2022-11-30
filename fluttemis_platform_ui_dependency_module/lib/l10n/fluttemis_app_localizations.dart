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
  /// **'Um arquivo genbank é composto por sequências de nucleotídeos, informações do organismo de origem e suas anotações, como CDS, rRNA e gene'**
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
