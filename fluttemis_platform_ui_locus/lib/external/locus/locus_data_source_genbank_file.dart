import 'package:fluttemis_platform_ui_core/domain/file_failure.dart';
import 'package:fluttemis_platform_ui_core/utils/custom_date_format.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/foundation.dart';

import '../../domain/locus/location_position.dart';
import '../../infrastructure/feature/feature_dto.dart';
import '../../infrastructure/locus/i_locus_data_source.dart';
import '../../infrastructure/locus/locus_dto.dart';

class LocusDataSourceGenbankFile implements ILocusDataSource {
  late final String genbankFile;
  final genbank = Genbank();

  LocusDataSourceGenbankFile({
    required this.genbankFile,
  });

  @override
  Future<Either<FileFailure, List<LocusDto>>> getLocus() async {
    final locus = await compute(genbank.open, genbankFile);

    return locus.join(
      (genbankError) => genbankError.failure.join(
        (fileNotFound) => left(FileFailure.notFound()),
        (fileParseError) => left(FileFailure.parseError(fileParseError.error)),
        (fileEmpty) => left(FileFailure.empty()),
        (fileFormatIncorrect) => left(FileFailure.formatIncorrect()),
        (fileDataFormatIncorrect) => left(FileFailure.formatDataIncorrect()),
      ),
      (genbank) => right(
        genbank.data
            .asList()
            .map(
              (data) => LocusDto(
                name: data.locus.name,
                length: data.locus.length,
                type: data.locus.type,
                shape: data.locus.shape,
                organism: data.locusDetails.source!,
                releaseDate: DateTime.parse(
                  CustomDateFormat.yMd(data.locus.releaseDate).dateFormatted,
                ),
                sequence: data.locus.sequence,
                features: data.features
                    .asList()
                    .map(
                      (feature) => FeatureDto(
                        positions: feature.positions
                            .map(
                              (position) => LocationPosition(
                                start: position.start,
                                end: position.end,
                              ),
                            )
                            .toList(),
                        start: feature.positions
                            .reduce(
                              (value, element) => value.start < element.start ? value : element,
                            )
                            .start,
                        end: feature.positions
                            .reduce(
                              (value, element) => value.end > element.end ? value : element,
                            )
                            .end,
                        startToDraw: feature.positions.first.end == data.locus.length
                            ? feature.positions.last.start
                            : feature.positions.first.start,
                        endToDraw: feature.positions.first.end == data.locus.length
                            ? feature.positions.last.end
                            : feature.positions.first.end,
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
