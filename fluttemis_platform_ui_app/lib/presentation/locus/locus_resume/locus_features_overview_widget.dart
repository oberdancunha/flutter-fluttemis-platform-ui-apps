import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/card/platform_card_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/scrollbar/platform_scrollbar_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class LocusFeaturesOverviewWidget extends StatefulWidget {
  final int total;
  final Map<String, int> featuresTypesCount;

  const LocusFeaturesOverviewWidget({
    required this.total,
    required this.featuresTypesCount,
    super.key,
  });

  @override
  State<LocusFeaturesOverviewWidget> createState() => _LocusFeaturesOverviewWidgetState();
}

class _LocusFeaturesOverviewWidgetState extends State<LocusFeaturesOverviewWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) => OverviewDataListWidget(
        title: FluttemisAppLocalizations.of(context)!.locusOverview,
        listOverviewData: [
          OverviewDataModel(
            value: widget.total.toString(),
            description: FluttemisAppLocalizations.of(context)!.totalLocus,
            image: 'assets/images/data/total_locus.png',
          ),
          OverviewDataModel(
            value: widget.featuresTypesCount.length.toString(),
            description: FluttemisAppLocalizations.of(context)!.totalTypeLocus,
            image: 'assets/images/data/total_locus_types.png',
          ),
        ],
        widgets: [
          SizedBox(
            height: 200,
            child: PlatformCardWidget(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 3,
                  left: 8,
                  top: 8,
                  bottom: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlatformTextWidget(
                      FluttemisAppLocalizations.of(context)!.countTypeLocus,
                      textType: TextType.subTitle,
                      fontSize: 15,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: PlatformScrollbarWidget(
                        controller: _scrollController,
                        child: GridView.count(
                          crossAxisSpacing: 5,
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          physics: const ClampingScrollPhysics(),
                          childAspectRatio: 2.23,
                          controller: _scrollController,
                          padding: const EdgeInsets.only(right: 6),
                          children: widget.featuresTypesCount.keys
                              .map<Widget>(
                                (featureType) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/data/count_type_locus.png',
                                      width: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          PlatformTextWidget(
                                            widget.featuresTypesCount[featureType].toString(),
                                            textType: TextType.label,
                                            fontSize: 15,
                                          ),
                                          SingleChildScrollView(
                                            physics: const ClampingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            padding: const EdgeInsets.only(bottom: 6),
                                            child: PlatformTextWidget(
                                              featureType,
                                              textType: TextType.caption,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
