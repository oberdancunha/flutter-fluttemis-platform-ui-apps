import 'dart:io' show Platform;

import 'package:fluttemis_platform_ui_core/domain/file_failure.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_locus/external/locus/locus_data_source_genbank_file.dart';
import 'package:fluttemis_platform_ui_locus/infrastructure/locus/locus_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:path/path.dart" show dirname;
import 'package:path/path.dart' as path;

import '../../data/genbank_dto.dart';

void main() {
  late LocusDataSourceGenbankFile locusDataSourceGenbankFile;
  late String basePath;
  late String testDataPath;
  late String joinLocationsFeaturesFile;

  setUpAll(() {
    basePath = path.fromUri(dirname(Platform.script.toString()));
    testDataPath = 'test/data';
    joinLocationsFeaturesFile = '$testDataPath/SA20083530_join_locations_features.gb';
  });

  Future<Either<FileFailure, List<LocusDto>>> locusDataSourceGenbankFileGet() =>
      locusDataSourceGenbankFile.getLocus();

  group(
    'Success |',
    () {
      test(
        'Should return locusDto list (right(List<LocusDto>))',
        () async {
          final genbankFile = path.join(basePath, '$testDataPath/sequence.gb');
          locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFile);
          final listLocusDtoMocked = getLocusDto();
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(listLocus.toString(), equals(right(listLocusDtoMocked).toString()));
        },
      );

      group('Join locations feature |', () {
        test(
          'Should return startDraw 1 and endDraw 1487 when location is join(62795..62813,1..1487)',
          () async {
            final genbankFile = path.join(basePath, joinLocationsFeaturesFile);
            locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFile);
            final listLocus = (await locusDataSourceGenbankFileGet()).foldRight<List<LocusDto>>(
              [],
              (_, listLocus) => listLocus,
            );
            final feature = listLocus.first.features.elementAt(2);
            expect(feature.positions.elementAt(0).start, equals(62795));
            expect(feature.positions.elementAt(0).end, equals(62813));
            expect(feature.positions.elementAt(1).start, equals(1));
            expect(feature.positions.elementAt(1).end, equals(1487));
            expect(feature.start, equals(1));
            expect(feature.end, equals(62813));
            expect(feature.startToDraw, equals(1));
            expect(feature.endToDraw, equals(1487));
          },
        );

        test(
          'Should return startDraw 1 and endDraw 1487 when location is join(1..1487,62795..62813)',
          () async {
            final genbankFile = path.join(basePath, joinLocationsFeaturesFile);
            locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFile);
            final listLocus = (await locusDataSourceGenbankFileGet()).foldRight<List<LocusDto>>(
              [],
              (_, listLocus) => listLocus,
            );
            final feature = listLocus.first.features.elementAt(4);
            expect(feature.positions.elementAt(0).start, equals(1));
            expect(feature.positions.elementAt(0).end, equals(1487));
            expect(feature.positions.elementAt(1).start, equals(62795));
            expect(feature.positions.elementAt(1).end, equals(62813));
            expect(feature.start, equals(1));
            expect(feature.end, equals(62813));
            expect(feature.startToDraw, equals(1));
            expect(feature.endToDraw, equals(1487));
          },
        );
      });
    },
  );

  group(
    'Failure |',
    () {
      test(
        'Should return a FileFailure.notFound() when file not exists',
        () async {
          const fileName = 'sequence1.gb';
          final genbankFileNotFound = path.join(basePath, '$testDataPath/$fileName');
          locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFileNotFound);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(
            listLocus,
            equals(
              left(FileFailure.notFound()),
            ),
          );
        },
      );

      test(
        'Should return a FileFailure.empty when file is empty',
        () async {
          const fileName = 'sequence_empty.gb';
          final genbankFileEmpty = path.join(basePath, '$testDataPath/$fileName');
          locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFileEmpty);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(
            listLocus,
            equals(
              left(FileFailure.empty()),
            ),
          );
        },
      );

      test(
        'Should return a FileFailure.formatIncorrect when file format is not a genbank',
        () async {
          const fileName = 'sequence_invalid_format.gb';
          final genbankFileInvalidFormat = path.join(basePath, '$testDataPath/$fileName');
          locusDataSourceGenbankFile =
              LocusDataSourceGenbankFile(genbankFile: genbankFileInvalidFormat);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(
            listLocus,
            equals(
              left(FileFailure.formatIncorrect()),
            ),
          );
        },
      );

      test(
        'Should return a FileFailure.parseError when file format is not a genbank',
        () async {
          const fileName = 'CP003200.gb';
          final genbankFileInvalidFormat = path.join(basePath, '$testDataPath/$fileName');
          locusDataSourceGenbankFile =
              LocusDataSourceGenbankFile(genbankFile: genbankFileInvalidFormat);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(
            listLocus.toString(),
            left<FileFailure, List<LocusDto>>(
              FileFailure.parseError('Null check operator used on a null value'),
            ).toString(),
          );
        },
      );

      test(
        'Should return a FileFailure.formatDataIncorrect when there is any incorrect data.',
        () async {
          const fileName = 'SCU49845_incorrect_data_format.gb';
          final genbankFileInvalidFormat = path.join(basePath, '$testDataPath/$fileName');
          locusDataSourceGenbankFile =
              LocusDataSourceGenbankFile(genbankFile: genbankFileInvalidFormat);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(
            listLocus.toString(),
            left<FileFailure, List<LocusDto>>(
              FileFailure.formatDataIncorrect(),
            ).toString(),
          );
        },
      );
    },
  );
}
