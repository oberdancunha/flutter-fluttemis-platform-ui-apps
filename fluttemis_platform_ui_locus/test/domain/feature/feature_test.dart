import 'package:fluttemis_platform_ui_core/domain/value_objects.dart';
import 'package:fluttemis_platform_ui_locus/domain/feature/feature.dart';
import 'package:fluttemis_platform_ui_locus/domain/feature/feature_product_type.dart';
import 'package:fluttemis_platform_ui_locus/domain/locus/location_position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should calculate feature length for a single location position', () {
    final feature = Feature(
      id: UniqueIdValueObject(),
      positions: const [
        LocationPosition(
          start: 3300,
          end: 4037,
        ),
      ],
      start: 3300,
      end: 4037,
      startToDraw: 3300,
      endToDraw: 4037,
      type: 'CDS',
      strand: StrandTypeValueObject(1),
      productType: FeatureProductType.known,
      show: true,
      typeByOverlap: 'CDS',
    );
    expect(feature.length, equals(738));
  });

  test('Should calculate feature length for multiple location positions', () {
    final feature = Feature(
      id: UniqueIdValueObject(),
      positions: const [
        LocationPosition(
          start: 147594,
          end: 151006,
        ),
        LocationPosition(
          start: 151097,
          end: 151166,
        ),
      ],
      start: 147594,
      end: 151006,
      startToDraw: 147594,
      endToDraw: 151006,
      type: 'CDS',
      strand: StrandTypeValueObject(1),
      productType: FeatureProductType.known,
      show: true,
      typeByOverlap: 'CDS',
    );
    expect(feature.length, equals(3483));
  });
}
