# Flutter Fluttemis Platform UI Apps

Esse projeto é uma melhoria do projeto [fluttemis original](https://github.com/oberdancunha/flutter-fluttemis-app), principalmente em relação ao seu aspecto visual, com uma roupagem mais sofisticada e profissional.

## Tecnologias/bibliotecas

Algumas das tecnologias/bibliotecas utilizadas na construção do software foram:

 - Flutter toolkit 3.3.6 (stable) apenas desktop (macos, windows e linux)
 - Dart 2.18.2
 - fluent_ui: 4.0.3
 - macos_ui: 1.7.6
 - flutter_modular: 5.0.3
 - file_picker: 5.2.2
 - [bio-dart-package](https://github.com/oberdancunha/dart-bio-package)
 - collection: 1.16.0
 - equatable: 2.0.5
 - fpdart: 0.3.0
 - freezed_annotation: 2.2.0
 - kt_dart: 0.9.1
 - window_manager: 0.2.7
 - intl: 0.17.0
 - lottie: 2.0.0
 - data_table_2: 2.3.10
 - touchable: 1.0.2
 - linked_scroll_controller: 0.2.0
 - selectable: 0.2.9
 - clipboard_watcher: 0.1.3
 - dart_code_metrics: 5.0.1
 - lint: 1.10.0
 - mocktail: 0.3.0
 - value_listenable_test: 0.0.1

Além dessas, há também outras bibliotecas. O pubspec.yaml possui a lista completa das bibliotecas utilizadas.

## Pontos sobre as diferenças da primeira versão

### Go-flutter

Esta, na verdade, é uma modificação implementada na biblioteca file_picker, pois a versão de flutter para desktop necessitava de um wrapper implementado em Go, chamado <b>go-flutter</b>, para acesso às apis do sistema operacional, como, nesse caso, o file system. 

Esse wrapper precisava ser configurado manualmente para que o file_picker funcionasse corretamente. Atualmente o file_picker usa uma implementação nativa em dart, independente de sistema operacional, ou seja, basta apenas instalar e a biblioteca estará pronta para uso.

### Mudança na gerência de estado

A primeira versão do Fluttemis utilizava o <b>bloc</b> para a gerência de estado. O bloc é uma abordagem de gerência de estado fantástica. No entanto, depois de muito pensar na etapa de refatoração, a conclusão é que as gerências nativas do flutter, como o <b>value_notifier</b> e o <b>change_notifier</b> satisfazem completamente as necessidades do projeto. 

### Internacionalização

Todos os textos do software, exceto os relacionados a dados (de um arquivo genbank, por exemplo), estão internacionalizados. Até o momento da escrita desse texto, o único idioma utilizado é o português. No entanto, a ideia é que em breve o inglês seja inserido.

### Tema claro e tema escuro

O tema claro e o tema escuro estão disponíveis para as 3 plataformas (macos, windows e linux). A escolha do tema acompanha diretamente a aparência corrente do sistema operacional.

### Remoção da biblioteca freezed

A biblioteca freezed possui seus atributos, principalmente no que tange em relação a classes seladas ([sealed classes](https://kotlinlang.org/docs/sealed-classes.html)), [data class](https://medium.com/@wiaamkareem/data-classes-in-dart-84ff7e5339fe), e  [JSON serialization](https://docs.flutter.dev/development/data-and-backend/json), permitindo códigos bem mais enxutos, devido ao boilerplate gerado através do [build_runner](https://pub.dev/packages/build_runner).

Apesar de tais recursos, o freezed foi retirado na refatoração dessa versão do Fluttemis. E o principal motivo é que não havia a necessidade do uso de seus recursos no projeto. Para o data class, a biblioteca [equatable](https://pub.dev/packages/equatable) satisfaz muito bem, de modo bem mais simples. Para as classes seladas, o uso de switch-case para a verificação de tipos classes atende muito bem as necessidades. E quanto ao JSON serialization, por enquanto, não há leitura alguma de JSON e mesmo que futuramente seja necessário, a opção será para um implementação própria.

No momento, há a necessidade da instalação do [json_annotation](https://pub.dev/packages/json_annotation) no <b>pubspec.yaml</b>, devido a dependência do <b>bio-dart-package</b>, que faz uso do freezed. No entanto, a ideia futura é a remoção do freezed dessa biblioteca.

## O Projeto

### Estrutura

A primeira versão do Fluttemis foi construída dentro de um mesmo projeto. Nessa versão, o software foi destrinchado em 4 projetos:

#### fluttemis_platform_ui_app

É a aplicação em si, onde o build é realizado. É nele onde ficam os assets (imagens e fonts), a separação dos módulos [flutter_modular](https://modular.flutterando.com.br/docs/intro/), além de algumas páginas/widgets.

#### fluttemis_platform_ui_core

O core é onde os dados estão organizados. É a localização das entidades, dos stores, repositórios e data sources (leitura de arquivo genbank, por exemplo).

#### fluttemis_platform_ui_dependency_module

É onde está localizado a lista das bibliotecas instaladas e disponibilizadas para todos os outros projetos. Além disso, é onde localiza-se também os arquivos usados na internacionalização dos textos.


#### fluttemis_platform_ui_design_system

É onde estão os componentes visuais e de funcionalidades para serem usados/reaproveitados durante todo o projeto. Nestes componentes visuais, há os componentes de identidade visual baseado na plataforma e componentes visual comum entre elas.

#### fluttemis_platform_ui_locus

É a aplicação voltada aos relatórios com os dados detalhados dos locus e features. Além disso, é nessa aplicação onde está localizado o mapa com o desenho gráfico das features, como a posição, organização e orientação de cada uma.

### Fluttemis original

O projeto Fluttemis original foi construído dando ênfase a 3 etapas:

1. <b>bio-dart-package:</b> O pacote bio dart é o responsável por receber um arquivo, genbank, por exemplo, realizar a leitura desse arquivo e armazenar o conteúdo em uma estrutura de dados.

2. <b>fluttemis core:</b> Aplicação core descrito anteriormente. É onde estão as implementações e testes dos domínios, stores, repositórios e data sources dos locus.

3. <b>mapa dos locus:</b> É o desenho gráfico do conjunto de features de um determinado locus. É um mapa que possui uma certa complexidade, pois é necessário que a posição, organização e orientação de cada feature seja representada de forma precisa para o correto entendimento dos dados. Além disso, o mapa possibilita a navegação horizontal (através das posições) e vertical (através dos seus tipos). Por fim, há também o cálculo da escala do desenho, baseado no tamanho do respectivo genoma, pois um genoma com cinco milhões de bases não deve ter a mesma métrica de desenho de um genoma de cem mil bases, pois tornaria a navegação do mapa cansativo e desconfortável.

Terminada a etapa do mapa, a ideia para o restante da aplicação era a construção de algo bem simples e sóbrio. Talvez essa ideia tenha resultado em uma aplicação menos criativa do que o seu potencial. E essa nova versão vem justamente com o propósito de melhorar essa questão.

### Fluttemis platform UI

Para essa versão, a interface não apenas foi completamente remodelada, como também possui a sua identidade visual de acordo com a respectiva plataforma. Windows, Macos e Linux, para cada uma dessas plataformas, o Fluttemis possui sua própria paleta de cores, fontes, bordas e sombreamentos completamente distintos, tanto no modo claro, como no modo escuro.

O desenvolvimento para Windows e Macos contou com uso das bibliotecas [fluent_ui](https://pub.dev/packages/fluent_ui) e o [macos_ui](https://pub.dev/packages/macos_ui), repectivamente. Ambas as bibliotecas possuem um completo conjunto de widgets com o propósito de permitir que cada detalhe da aplicação, desde uma caixa de texto, um botão, um ícone, a tonalidade das cores e seus efeitos tenham características semelhantes à plataforma de interesse.

Para a plataforma Linux não foi possível encontrar nenhuma bibloteca similar. Portanto, seu desenvolvimento baseou-se nos aspectos visuais do material design. Não deixa de fazer um certo sentido a falta dessa biblioteca, já que com tantas distribuições (Ubuntu, Mint, Deepin, Manjaro e etc...) e ambientes gráficos (Gnome, KDE, XFCE, Cinnamon e etc...) distintos, realmente não é muito trivial chegar a um consenso visual.