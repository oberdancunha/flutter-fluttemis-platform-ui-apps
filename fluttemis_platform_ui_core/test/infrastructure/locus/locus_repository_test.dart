import 'package:fluttemis_platform_ui_core/domain/core/failures.dart';
import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_core/infrastructure/locus/i_locus_data_source.dart';
import 'package:fluttemis_platform_ui_core/infrastructure/locus/locus_dto.dart';
import 'package:fluttemis_platform_ui_core/infrastructure/locus/locus_overlap.dart';
import 'package:fluttemis_platform_ui_core/infrastructure/locus/locus_repository.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../data/genbank_data.dart';
import '../../data/genbank_dto.dart';

class LocusDataSourceMock extends Mock implements ILocusDataSource {}

class LocusOverlapMock extends Mock implements LocusOverlap {}

void main() {
  late LocusRepository locusRepository;
  late LocusDataSourceMock locusDataSourceMock;
  late LocusOverlapMock locusOverlapMock;

  setUpAll(() {
    locusDataSourceMock = LocusDataSourceMock();
    locusOverlapMock = LocusOverlapMock();
    locusRepository = LocusRepository(
      locusDataSource: locusDataSourceMock,
      locusOverlap: locusOverlapMock,
    );
  });

  Future<Either<Failure, KtList<Locus>>> locusRepositoryGet() => locusRepository.getLocus();

  group(
    'Success | ',
    () {
      void mockFeaturesOverlap() {
        when(() => locusOverlapMock.getFeaturesOverlapsDifferentIdentifiers(any()))
            .thenReturn(getLocusReverseFeaturesDto());
      }

      void mockDataSourceGetLocusSuccess() {
        when(locusDataSourceMock.getLocus)
            .thenAnswer((_) async => right<Failure, List<LocusDto>>(getLocusDto()));
      }

      test(
        'Should return a immutable locus entity list (right(KtList<Locus>))',
        () async {
          mockFeaturesOverlap();
          mockDataSourceGetLocusSuccess();
          final locusMocked = getLocus();
          final listLocus = await locusRepositoryGet();
          expect(listLocus, equals(right(locusMocked)));
        },
      );
    },
  );

  group(
    'Failure | ',
    () {
      test(
        'Should return a Failure.fileNotFound when file not exists',
        () async {
          when(locusDataSourceMock.getLocus).thenAnswer(
            (_) async => left<Failure, List<LocusDto>>(
              FailureFileNotFound(),
            ),
          );
          final listLocus = await locusRepositoryGet();
          expect(
            listLocus,
            equals(
              left(
                FailureFileNotFound(),
              ),
            ),
          );
        },
      );

      test(
        'Should return a Failure.fileIsEmpty when file is empty',
        () async {
          when(locusDataSourceMock.getLocus).thenAnswer(
            (_) async => left<Failure, List<LocusDto>>(
              FailureFileEmpty(),
            ),
          );
          final listLocus = await locusRepositoryGet();
          expect(
            listLocus,
            equals(
              left(
                FailureFileEmpty(),
              ),
            ),
          );
        },
      );

      test(
        'Should return a Failure.fileFormatIncorrect when file format is not a genbank',
        () async {
          when(locusDataSourceMock.getLocus).thenAnswer(
            (_) async => left<Failure, List<LocusDto>>(
              FailureFileFormatIncorrect(),
            ),
          );
          final listLocus = await locusRepositoryGet();
          expect(
            listLocus,
            equals(
              left(
                FailureFileFormatIncorrect(),
              ),
            ),
          );
        },
      );

      test(
        'Should return a Failure.fileParseError when there are an unexpected error',
        () async {
          when(locusDataSourceMock.getLocus).thenAnswer(
            (_) async => left<Failure, List<LocusDto>>(
              FailureFileParseError(error: const {}),
            ),
          );
          final listLocus = await locusRepositoryGet();
          expect(
            listLocus,
            equals(
              left(
                FailureFileParseError(error: const {}),
              ),
            ),
          );
        },
      );
    },
  );
}
