import 'package:bloc_test/bloc_test.dart';
import 'package:fluttemis_platform_ui_core/application/locus/locus_bloc.dart';
import 'package:fluttemis_platform_ui_core/domain/core/failures.dart';
import 'package:fluttemis_platform_ui_core/domain/locus/i_locus_repository.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../data/genbank_data.dart';

class MockLocusRepository extends Mock implements ILocusRepository {}

void main() {
  late MockLocusRepository mockLocusRepository;
  late LocusBloc locusBloc;

  setUpAll(() {
    mockLocusRepository = MockLocusRepository();
  });

  setUp(
    () {
      locusBloc = LocusBloc(locusRepository: mockLocusRepository);
    },
  );

  test(
    'Should verify initial state',
    () {
      expect(locusBloc.state, isA<LocusState>());
      expect(locusBloc.state, equals(LocusStateInitial()));
    },
  );

  group(
    'Get locus list |',
    () {
      group('Get locus list successfully |', () {
        blocTest<LocusBloc, LocusState>(
          'Should expect load and success states with locus list and its features',
          build: () {
            when(() => mockLocusRepository.getLocus()).thenAnswer((_) async => right(getLocus()));

            return locusBloc;
          },
          act: (bloc) => bloc.add(LocusEventGetLocus()),
          verify: (_) {
            verify(() => mockLocusRepository.getLocus()).called(1);
          },
          expect: () => [
            LocusStateLoad(),
            LocusStateSuccess(getLocus()),
          ],
        );
      });

      group(
        'Get locus list error |',
        () {
          blocTest<LocusBloc, LocusState>(
            'Should expect load and failure states with file format incorrect error',
            build: () {
              when(() => mockLocusRepository.getLocus()).thenAnswer(
                (_) async => left(FailureFileFormatIncorrect()),
              );

              return locusBloc;
            },
            act: (bloc) => bloc.add(LocusEventGetLocus()),
            verify: (_) {
              verify(() => mockLocusRepository.getLocus()).called(1);
            },
            expect: () => [
              LocusStateLoad(),
              LocusStateFailure(FailureFileFormatIncorrect()),
            ],
          );
        },
      );
    },
  );

  tearDown(
    () async {
      await locusBloc.close();
    },
  );
}
