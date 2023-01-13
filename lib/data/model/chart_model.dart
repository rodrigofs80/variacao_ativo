import 'package:json_annotation/json_annotation.dart';
import 'package:variacao_ativo/data/model/result_model.dart';
import 'package:variacao_ativo/domain/entitie/chart_entity.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ChartModel extends ChartEntity {

  @JsonKey(name: 'result', required: true)
  final List<ResultModel> result;

  @JsonKey(name: 'error', required: true)
  final String error;

  ChartModel({
    required this.result,
    required this.error,
  }) : super(result: result, error: error);

  factory ChartModel.fromJson(Map<dynamic, dynamic> json){
    List<ResultModel> temp = [];
    for(var resultEntity in json['result']){
      temp.add(ResultModel.fromJson(resultEntity));
    }
    return ChartModel(
        error: json['error'] ?? '',
        result: temp
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['error'] = error;
    return data;
  }

  ChartEntity toEntity() => _$ChartModelToEntity(this);
}

ChartEntity _$ChartModelToEntity(ChartEntity model) {
  return ChartEntity(
    result: model.result,
    error: model.error,
  );
}