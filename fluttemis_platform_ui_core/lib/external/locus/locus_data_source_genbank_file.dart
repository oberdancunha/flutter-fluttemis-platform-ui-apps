import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/core/failures.dart';
import '../../infrastructure/locus/feature_dto.dart';
import '../../infrastructure/locus/i_locus_data_source.dart';
import '../../infrastructure/locus/locus_dto.dart';

class LocusDataSourceGenbankFile implements ILocusDataSource {
  late final String genbankFile;
  final genbank = Genbank();

  LocusDataSourceGenbankFile({
    required this.genbankFile,
  });

  @override
  Future<Either<Failure, List<LocusDto>>> getLocus() async {
    final locus = await genbank.open(genbankFile);

    return locus.when(
      failure: (failure) => failure.when(
        fileNotFound: () => left(FailureFileNotFound()),
        fileParseError: (error) => left(FailureFileParseError(error: error)),
        fileEmpty: () => left(FailureFileEmpty()),
        fileFormatIncorrect: () => left(FailureFileFormatIncorrect()),
      ),
      data: (genbankData) => right(
        genbankData
            .asList()
            .map(
              (data) => LocusDto(
                name: data.locus.name,
                length: data.locus.length,
                type: data.locus.type,
                shape: data.locus.shape,
                organism: data.locusDetails.source!,
                releaseDate: data.locus.releaseDate,
                sequence: data.locus.sequence,
                features: data.features
                    .asList()
                    .map(
                      (feature) => FeatureDto(
                        start: feature.start,
                        end: feature.end,
                        type: feature.type,
                        strand: feature.strand,
                        aminoacids: feature.aminoacids,
                        nucleotides: feature.nucleotides,
                        name: feature.name,
                        note: feature.note,
                        product: feature.product,
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }
}
