import 'package:flutter/widgets.dart';

import '../platform/tool_card/platform_tool_card_widget.dart';

class MenuToolsWidget extends StatelessWidget {
  const MenuToolsWidget({super.key});

  @override
  Widget build(BuildContext context) => GridView.count(
        primary: true,
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.55,
        padding: const EdgeInsets.all(20),
        children: const [
          PlatformToolCardWidget(
            mainTitle: 'Genbank',
            secondaryTitle: 'Leitura de arquivo',
            description:
                'Um arquivo genbank é composto por sequências de nucleotídeos, informações do organismo de origem e suas anotações, como CDS, rRNA e gene.',
            image: 'assets/images/ncbi.png',
          ),
        ],
      );
}
