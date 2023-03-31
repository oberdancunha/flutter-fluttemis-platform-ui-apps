import 'package:fluttemis_platform_ui_core/domain/failure.dart';
import 'package:fluttemis_platform_ui_core/domain/file_failure.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_locus/application/locus/locus_state.dart';
import 'package:fluttemis_platform_ui_locus/application/locus/locus_store.dart';
import 'package:fluttemis_platform_ui_locus/domain/locus/i_locus_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

import '../../data/genbank_data.dart';

class MockLocusRepository extends Mock implements ILocusRepository {}

void main() {
  late MockLocusRepository mockLocusRepository;
  late LocusStore locusStore;

  setUpAll(() {
    mockLocusRepository = MockLocusRepository();
  });

  setUp(
    () {
      locusStore = LocusStore(locusRepository: mockLocusRepository);
    },
  );

  test('Should verify initial state', () {
    expect(
      locusStore.value,
      equals(
        const LocusState(
          locus: KtList.empty(),
          isLoading: false,
          failure: null,
        ),
      ),
    );
  });

  valueListenableTest<LocusStore>(
    'Should call getLocus from locusRepository and change initial state to success state',
    build: () {
      when(() => mockLocusRepository.getLocus()).thenAnswer((_) async => right(getLocus()));

      return locusStore;
    },
    act: (notifier) => notifier.getLocus(),
    verify: (_) {
      verify(() => mockLocusRepository.getLocus()).called(1);
    },
    expect: () => [
      const LocusState(
        locus: KtList.empty(),
        isLoading: true,
        failure: null,
      ),
      LocusState(
        locus: getLocus(),
        isLoading: true,
        failure: null,
      ),
      LocusState(
        locus: getLocus(),
        isLoading: false,
        failure: null,
      ),
    ],
  );

  valueListenableTest<LocusStore>(
    'Should call getLocus from locusRepository and change initial state to failure state with file format incorrect error',
    build: () {
      when(() => mockLocusRepository.getLocus()).thenAnswer(
        (_) async => left(
          Failure.file(FileFailure.formatIncorrect()),
        ),
      );

      return locusStore;
    },
    act: (notifier) => notifier.getLocus(),
    verify: (_) {
      verify(() => mockLocusRepository.getLocus()).called(1);
    },
    expect: () => [
      const LocusState(
        locus: KtList.empty(),
        isLoading: true,
        failure: null,
      ),
      LocusState(
        locus: const KtList.empty(),
        isLoading: true,
        failure: Failure.file(FileFailure.formatIncorrect()),
      ),
      LocusState(
        locus: const KtList.empty(),
        isLoading: false,
        failure: Failure.file(FileFailure.formatIncorrect()),
      ),
    ],
  );

  tearDown(() {
    locusStore.dispose();
  });
}
