import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'build_tool_card.dart';
import 'platform_tool_card_widget.dart';

class MacosToolCardWidget extends PlatformToolCardWidget {
  const MacosToolCardWidget({
    required super.mainTitle,
    required super.secondaryTitle,
    required super.description,
    required super.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BuildToolCard(
        image: image,
        secondaryTitle: secondaryTitle,
        mainTitle: mainTitle,
        cardDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: MacosTheme.of(context).primaryColor,
          ),
        ),
        secondaryTitleStyle: MacosTheme.of(context).typography.title3,
        mainTitleStyle: MacosTheme.of(context).typography.title1,
        mainTitleColor: MacosTheme.of(context).primaryColor.withAlpha(255),
        description: description,
        descriptionStyle: MacosTheme.of(context).typography.footnote,
        actionButtonColor: MacosTheme.of(context).primaryColor,
        actionButtonBorderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
        ),
        actionButtonIcon: CupertinoIcons.doc_text_fill,
        actionButtonIconColor: MacosColors.white,
      );
}
  
//   LayoutBuilder(
//         builder: (_, constraints) => DecoratedBox(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(
//               color: MacosTheme.of(context).primaryColor,
//             ),
//           ),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: constraints.maxHeight / 2,
//                 child: Image.asset(
//                   image,
//                   width: constraints.maxWidth / 2,
//                 ),
//               ),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   text: 'Leitura de arquivo \n',
//                   style: MacosTheme.of(context).typography.title3.copyWith(
//                         fontSize: constraints.maxWidth / 15,
//                       ),
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: 'Genbank',
//                       style: MacosTheme.of(context).typography.title1.copyWith(
//                             color: MacosTheme.of(context).primaryColor.withAlpha(255),
//                             fontSize: constraints.maxWidth / 10,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: constraints.maxWidth / 10),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Text(
//                     'Um arquivo genbank é composto por sequências de nucleotídeos, informações do organismo de origem e suas anotações, como CDS, rRNA e gene.',
//                     style: MacosTheme.of(context).typography.footnote.copyWith(
//                           fontSize: constraints.maxWidth / 25,
//                         ),
//                     textAlign: TextAlign.justify,
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Container(
//                   height: constraints.maxHeight / 15,
//                   width: constraints.maxWidth / 7.5,
//                   decoration: BoxDecoration(
//                     color: MacosTheme.of(context).primaryColor,
//                     borderRadius: const BorderRadius.only(
//                       bottomRight: Radius.circular(15),
//                     ),
//                   ),
//                   child: MacosTooltip(
//                     message: 'Abrir arquivo',
//                     child: Icon(
//                       CupertinoIcons.doc_text_fill,
//                       size: constraints.maxWidth / 15,
//                       color: MacosColors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }
