import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import 'feature_strand.dart';

class Feature extends Equatable {
  final String id;
  final int start;
  final int end;
  final String type;
  final FeatureStrandType strand;
  final int color;
  final bool show;
  final String typeByOverlap;
  final String? name;
  final String? product;
  final String? nucleotides;
  final String? aminoacids;
  final String? note;

  const Feature({
    required this.id,
    required this.start,
    required this.end,
    required this.type,
    required this.strand,
    required this.color,
    required this.show,
    required this.typeByOverlap,
    this.name,
    this.product,
    this.nucleotides,
    this.aminoacids,
    this.note,
  });

  @override
  List<Object?> get props => [
        id,
        start,
        end,
        type,
        strand,
        color,
        show,
        typeByOverlap,
        name,
        product,
        nucleotides,
        aminoacids,
        note,
      ];
}
