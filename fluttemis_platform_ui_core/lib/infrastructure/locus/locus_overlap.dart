import '../../domain/core/value_transformer.dart';
import 'feature_dto.dart';

class LocusOverlap {
  int _overlap = 0;
  int _adjustOverlapLevel = 0;
  String _typeByOverlap = "";

  List<FeatureDto> getFeaturesOverlapsDifferentIdentifiers(List<FeatureDto> features) {
    _resetClassProperties();
    late final List<FeatureDto> featuresWithOverlap = [];
    final featuresOrderReversed = _reverseFeaturesOrder(features);

    return featuresOrderReversed.map(
      (feature) {
        _typeByOverlap = feature.type;
        if (shouldDrawFeature(feature.type)) {
          _overlap = _getOverlap(
            featuresWithOverlap: featuresWithOverlap,
            featureType: feature.type,
            featureEnd: feature.end,
          );
          if (_overlap > 0) {
            if (_isOverlapLevelGreaterThanZero(_adjustOverlapLevel, _overlap)) {
              _increaseFeatureLevel();
            } else {
              _resetFeatureLevel();
            }
          } else {
            _adjustOverlapLevel = 0;
          }
          featuresWithOverlap.add(feature);
        }
        final featureWithOverlapLevel = feature.copyWith(
          typeByOverlap: _typeByOverlap,
        );

        return featureWithOverlapLevel;
      },
    ).toList();
  }

  List<FeatureDto> _reverseFeaturesOrder(List<FeatureDto> locusDtoFeatures) =>
      List<FeatureDto>.from(locusDtoFeatures)
        ..sort(
          (featureDtoA, featureDtoB) => featureDtoB.start.compareTo(featureDtoA.start),
        );

  int _getOverlap({
    required List<FeatureDto> featuresWithOverlap,
    required String featureType,
    required int featureEnd,
  }) =>
      featuresWithOverlap
          .where(
            (featureWithOverlap) =>
                featureType == featureWithOverlap.type && featureWithOverlap.start <= featureEnd,
          )
          .length;

  bool _isOverlapLevelGreaterThanZero(int adjustOverlapLevel, int overlap) =>
      adjustOverlapLevel == 0 || overlap > 1;

  void _resetClassProperties() {
    _resetFeatureLevel();
    _typeByOverlap = "";
  }

  void _increaseFeatureLevel() {
    _overlap -= _adjustOverlapLevel;
    _typeByOverlap += '#$_overlap';
    _adjustOverlapLevel++;
  }

  void _resetFeatureLevel() {
    _overlap = 0;
    _adjustOverlapLevel = 0;
  }
}
