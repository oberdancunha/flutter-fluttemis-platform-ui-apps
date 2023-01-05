import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_resource_types_enum.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_core/utils/custom_date_format.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class GenomeOverviewWidget extends StatefulWidget {
  final Locus locus;

  const GenomeOverviewWidget({
    required this.locus,
    super.key,
  });

  @override
  State<GenomeOverviewWidget> createState() => _GenomeOverviewWidgetState();
}

class _GenomeOverviewWidgetState extends State<GenomeOverviewWidget> {
  late AccessHistoryStore _accessHistoryStore;
  String? _resourceDescription;
  AccessHistoryResourceTypes? _resourceType;

  @override
  void initState() {
    super.initState();
    _accessHistoryStore = Modular.get<AccessHistoryStore>();
    _resourceDescription = _accessHistoryStore.value.resourceDescription;
    _resourceType = _accessHistoryStore.value.resourceType;
  }

  @override
  Widget build(BuildContext context) => OverviewDataListWidget(
        title: FluttemisAppLocalizations.of(context)!.genomeOverview,
        listOverviewData: [
          if (_resourceDescription != null && _resourceType != null)
            _getOverviewDataModeByResourceType(
              resourceDescription: _resourceDescription!,
              resourceType: _resourceType!,
            ),
          OverviewDataModel(
            value: widget.locus.organism,
            description: FluttemisAppLocalizations.of(context)!.genomeName,
            image: 'assets/images/data/genome_name.png',
            textType: TextType.genomeName,
          ),
          OverviewDataModel(
            value: widget.locus.name,
            description: FluttemisAppLocalizations.of(context)!.genomeCodeAccession,
            image: 'assets/images/data/genome_code.png',
          ),
          OverviewDataModel(
            value: widget.locus.length.toString(),
            description: FluttemisAppLocalizations.of(context)!.genomeLength,
            image: 'assets/images/data/dna.png',
          ),
          OverviewDataModel(
            value: widget.locus.type,
            description: FluttemisAppLocalizations.of(context)!.genomeType,
            image: 'assets/images/data/genome_type.png',
          ),
          if (widget.locus.shape != null)
            OverviewDataModel(
              value: widget.locus.shape!,
              description: FluttemisAppLocalizations.of(context)!.genomeShape,
              image: 'assets/images/data/genome_shape.png',
            ),
          if (widget.locus.releaseDate != null)
            OverviewDataModel(
              value: DateFormat.yMMMMd(FluttemisAppLocalizations.of(context)!.localeName).format(
                DateTime.parse(
                  CustomDateFormat.yMd(widget.locus.releaseDate!).dateFormatted,
                ),
              ),
              description: FluttemisAppLocalizations.of(context)!.annotationDate,
              image: 'assets/images/data/genome_date.png',
            ),
        ],
      );

  OverviewDataModel _getOverviewDataModeByResourceType({
    required String resourceDescription,
    required AccessHistoryResourceTypes resourceType,
  }) {
    switch (resourceType) {
      case AccessHistoryResourceTypes.file:
        return OverviewDataModel(
          value: resourceDescription,
          description: FluttemisAppLocalizations.of(context)!.genomeFileName,
          image: 'assets/images/data/genome_file.png',
        );
      case AccessHistoryResourceTypes.api:
        return OverviewDataModel(
          value: resourceDescription,
          description: FluttemisAppLocalizations.of(context)!.genomeApiName,
          image: 'assets/images/data/genome_api.png',
        );
    }
  }
}
