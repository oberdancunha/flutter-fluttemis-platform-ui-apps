import 'package:fluttemis_platform_ui_core/domain/failure.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

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
  Future<Either<Failure, KtList<Locus>>> getLocus() async {
    final locus = await locusDataSource.getLocus();

    return locus.fold(
      (fileFailure) => left(Failure.file(fileFailure)),
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
