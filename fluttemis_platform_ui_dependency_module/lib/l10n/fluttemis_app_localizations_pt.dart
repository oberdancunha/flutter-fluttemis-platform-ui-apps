import 'fluttemis_app_localizations.dart';

/// The translations for Portuguese (`pt`).
class FluttemisAppLocalizationsPt extends FluttemisAppLocalizations {
  FluttemisAppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get mainMenu => 'Menu principal';

  @override
  String get openFile => 'Abrir arquivo';

  @override
  String get genbankDescription => 'Um arquivo genbank é composto por sequências de nucleotídeos, informações do organismo de origem e suas anotações, como CDS, rRNA e gene.';

  @override
  String get toolAcceptedExtensions => 'Extensões aceitas: ';

  @override
  String get fileEmpty => 'Erro na leitura do arquivo: arquivo vazio';

  @override
  String get fileFormatError => 'Erro na leitura do arquivo: formato desconhecido';

  @override
  String get fileNotFound => 'Erro na leitura do arquivo: arquivo não encontrado';

  @override
  String get fileUnexpectedError => 'Erro na leitura do arquivo: erro não esperado';

  @override
  String get nextOptionInError => 'Escolha uma das opções a seguir';

  @override
  String get backTo => 'Voltar para o';

  @override
  String get goToMenu => 'Ir para o menu';

  @override
  String get menuDescription => 'Caso queira desistir de usar a ferramenta escolhida, você pode acessar diretamente o menu principal do sistema.';

  @override
  String get tryMessage => 'Tentar';

  @override
  String get again => 'Novamente';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get tryAgainDescription => 'Caso desconfie de que o erro tenha acontecido por alguma instabilidade do momento, você pode tentar realizar essa tarefa novamente.';

  @override
  String get fileReading => 'Lendo dados do arquivo';

  @override
  String get apiReading => 'Lendo dados da API';

  @override
  String get quicklyAccess => 'Acesso rápido';

  @override
  String get productColorLabel => 'Legenda de cores pelo tipo do produto';

  @override
  String get genomeOverview => 'Dados gerais do genoma';

  @override
  String get genomeFileName => 'Nome do arquivo';

  @override
  String get genomeApiName => 'Endereço da API';

  @override
  String get genomeCodeAccession => 'Código de acesso de anotação do genoma';

  @override
  String get genomeLength => 'Quantidade de bases de dna do genoma';

  @override
  String get genomeType => 'Tipo de genoma';

  @override
  String get genomeShape => 'Forma do genoma';

  @override
  String get annotationDate => 'Data em que a anotação tornou-se pública';

  @override
  String get locusOverview => 'Dados gerais dos locus';

  @override
  String get totalLocus => 'Total de locus';

  @override
  String get totalTypeLocus => 'Total de tipos de locus';

  @override
  String get countTypeLocus => 'Total de locus por tipo';
}
