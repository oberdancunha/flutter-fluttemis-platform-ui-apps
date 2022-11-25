import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/core/file_failures.dart';
import '../../domain/locus/i_locus_repository.dart';
import '../../domain/locus/locus.dart';
import 'i_locus_data_source.dart';
import 'locus_overlap.dart';

class LocusRepository implements ILocusRepository {
  final ILocusDataSource locusDataSource;
  final LocusOverlap locusOverlap;

  LocusRepository({
    required this.locusDataSource,
    required this.locusOverlap,
  });

  @override
  Future<Either<FileFailure, KtList<Locus>>> getLocus() async {
    final locus = await locusDataSource.getLocus();

    return locus.fold(
      left,
      (locusList) => right(
        locusList
            .map(
              (locusData) => locusData
                  .copyWith(
                    features:
                        locusOverlap.getFeaturesOverlapsDifferentIdentifiers(locusData.features),
                  )
                  .toDomain(),
            )
            .toImmutableList(),
      ),
    );
  }
}
