import 'package:variacao_ativo/src/data/model/chart_model.dart';
import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AtivoModel extends AtivoEntity {

  @JsonKey(name: 'chart', required: true)
  final ChartModel chart;

  AtivoModel({
    required this.chart,
  }) : super(chart);

  factory AtivoModel.fromJson(Map<String, dynamic> json){
    return AtivoModel(
      chart: ChartModel.fromJson(json['chart']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chart'] = chart;
    return data;
  }

  AtivoEntity toEntity() => _$AtivoModelToEntity(this);
}

AtivoEntity _$AtivoModelToEntity(AtivoEntity model) {
  return AtivoEntity(
    model.chart,
  );
}