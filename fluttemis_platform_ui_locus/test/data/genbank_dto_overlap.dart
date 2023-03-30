import 'package:fluttemis_platform_ui_locus/domain/locus/location_position.dart';
import 'package:fluttemis_platform_ui_locus/infrastructure/feature/feature_dto.dart';

List<FeatureDto> getFeatureOrder() => [
      const FeatureDto(
        positions: [
          LocationPosition(
            start: 7403,
            end: 8833,
          ),
        ],
        startToDraw: 7403,
        endToDraw: 8833,
        type: 'CDS',
        strand: 0,
        product: 'DNA cytosine methyltransferase',
        aminoacids:
            'MQENISVTHARNLIADDAGSEIQAMLSQLLEIYDVKTLVAHLNGLGEQHWSPAIFKRVMMNAAWHRLSDNELTCLKTGLPTPPAHHPHYAFRFIDLFAGIGGIRRGFEAIGGQCVFTSEWNKHAVRTYKANYFCDPLQHRFNEDIRDITLSHREGVSDDEAAEHIRQHIPQHDVLLAGFPCQPFSLAGVSKKNALGRAHGFACETQGTLFFDVVRIIDARRPALFVLENVKNLKSHDQGNTFRIIMQTLDELGYDVADAADNGPDDPKIIDGQHFLPQHRERIVLVGFRRDLNLKTDFTLRNIARCYPPRRPTLAELLEPVVEAKYILTPVLWKYLYRYAKKHQARGNGFGYGMVYPDNPESVARTLSARYYKDGAEILIDRGWDMAKGEVNFDDAGNQQHRPRRLTPRECARLMGFEAPQTYQFRIPVSDTQAYRQFGNSVVVPVFAAVAKLLEPKIHQAVTLRQRETVDGGRSR',
        nucleotides: '',
      ),
      const FeatureDto(
        positions: [
          LocationPosition(
            start: 8814,
            end: 9284,
          ),
        ],
        startToDraw: 8814,
        endToDraw: 9284,
        type: 'CDS',
        strand: 0,
        product: 'very short patch repair endonuclease',
        aminoacids:
            'MADVHDKATRSKNMRAIATRDTAIEKRLAGLLSAQGITFHTQDATLPGKPDFVVNDYDCVIFTHGCFWHHHHCYLFKVPATRTAFWLEKIGKNVERDERDIQRLQALGWRVLIVWECALRGRAKLSDAALAERLEEWICGGGASAQIDTQGIHLLA',
        nucleotides: '',
      ),
      const FeatureDto(
        positions: [
          LocationPosition(
            start: 9273,
            end: 10193,
          ),
        ],
        startToDraw: 9273,
        endToDraw: 10193,
        type: 'CDS',
        strand: 0,
        product: 'drug/metabolite exporter YedA',
        aminoacids:
            'MRFRQLLPLFGALFALYIIWGSTYFVIRIGVESWPPLMMAGVRFLSAGMLLMAFLLLRGEKLPPLRQTINAALIGLLLLAVGNGLVTVAEHQNVPSGIAAVVVATVPLFTLCFSYFFGIKTRKLEWVGIAIGLAGIILLNSGGNLSGNPWGAILILIGSMSWAFGSVYGSRIALPVGMMAGAIEMLAAGVVLLCAAFLSGEKLATLPGLSGFMAVGYLALFGSIIAINAYMYLIRNVSPALATSYAYVNPVVAVLLGTGLGGERLSPVEWAALGVIVFAVVLVTLGKYLFPARAVVTPCKTEDSRQ',
        nucleotides: '',
      ),
    ];

List<FeatureDto> getReverseFeaturesOrder() => [
      const FeatureDto(
        positions: [
          LocationPosition(
            start: 9273,
            end: 10193,
          ),
        ],
        startToDraw: 9273,
        endToDraw: 10193,
        type: 'CDS',
        strand: 0,
        typeByOverlap: "CDS",
        product: 'drug/metabolite exporter YedA',
        aminoacids:
            'MRFRQLLPLFGALFALYIIWGSTYFVIRIGVESWPPLMMAGVRFLSAGMLLMAFLLLRGEKLPPLRQTINAALIGLLLLAVGNGLVTVAEHQNVPSGIAAVVVATVPLFTLCFSYFFGIKTRKLEWVGIAIGLAGIILLNSGGNLSGNPWGAILILIGSMSWAFGSVYGSRIALPVGMMAGAIEMLAAGVVLLCAAFLSGEKLATLPGLSGFMAVGYLALFGSIIAINAYMYLIRNVSPALATSYAYVNPVVAVLLGTGLGGERLSPVEWAALGVIVFAVVLVTLGKYLFPARAVVTPCKTEDSRQ',
        nucleotides: '',
      ),
      const FeatureDto(
        positions: [
          LocationPosition(
            start: 8814,
            end: 9284,
          ),
        ],
        startToDraw: 8814,
        endToDraw: 9284,
        type: 'CDS',
        strand: 0,
        typeByOverlap: "CDS#1",
        product: 'very short patch repair endonuclease',
        aminoacids:
            'MADVHDKATRSKNMRAIATRDTAIEKRLAGLLSAQGITFHTQDATLPGKPDFVVNDYDCVIFTHGCFWHHHHCYLFKVPATRTAFWLEKIGKNVERDERDIQRLQALGWRVLIVWECALRGRAKLSDAALAERLEEWICGGGASAQIDTQGIHLLA',
        nucleotides: '',
      ),
      const FeatureDto(
        positions: [
          LocationPosition(
            start: 7403,
            end: 8833,
          ),
        ],
        startToDraw: 7403,
        endToDraw: 8833,
        type: 'CDS',
        strand: 0,
        typeByOverlap: "CDS",
        product: 'DNA cytosine methyltransferase',
        aminoacids:
            'MQENISVTHARNLIADDAGSEIQAMLSQLLEIYDVKTLVAHLNGLGEQHWSPAIFKRVMMNAAWHRLSDNELTCLKTGLPTPPAHHPHYAFRFIDLFAGIGGIRRGFEAIGGQCVFTSEWNKHAVRTYKANYFCDPLQHRFNEDIRDITLSHREGVSDDEAAEHIRQHIPQHDVLLAGFPCQPFSLAGVSKKNALGRAHGFACETQGTLFFDVVRIIDARRPALFVLENVKNLKSHDQGNTFRIIMQTLDELGYDVADAADNGPDDPKIIDGQHFLPQHRERIVLVGFRRDLNLKTDFTLRNIARCYPPRRPTLAELLEPVVEAKYILTPVLWKYLYRYAKKHQARGNGFGYGMVYPDNPESVARTLSARYYKDGAEILIDRGWDMAKGEVNFDDAGNQQHRPRRLTPRECARLMGFEAPQTYQFRIPVSDTQAYRQFGNSVVVPVFAAVAKLLEPKIHQAVTLRQRETVDGGRSR',
        nucleotides: '',
      ),
    ];
