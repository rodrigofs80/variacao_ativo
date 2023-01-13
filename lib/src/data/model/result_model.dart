import 'package:json_annotation/json_annotation.dart';
import 'package:variacao_ativo/src/data/model/indicator_model.dart';
import 'package:variacao_ativo/src/data/model/meta_model.dart';
import 'package:variacao_ativo/src/domain/entitie/result_entity.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ResultModel extends ResultEntity {

  @JsonKey(name: 'meta', required: true)
  final MetaModel meta;

  @JsonKey(name: 'timestamp', required: true)
  final List<int> timestamp;

  @JsonKey(name: 'indicators', required: true)
  final IndicatorModel indicators;

  ResultModel({
    required this.meta,
    required this.timestamp,
    required this.indicators,
  }) : super(meta: meta, timestamp: timestamp, indicators: indicators);

  factory ResultModel.fromJson(Map<dynamic, dynamic> json){
    List<int> ts = [];
    for(var time in json['timestamp']){
      ts.add(time);
    }
    return ResultModel(
      meta: MetaModel.fromJson(json['meta']),
      timestamp: ts,
      indicators: IndicatorModel.fromJson(json['indicators']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meta'] = meta;
    data['timestamp'] = timestamp;
    data['indicators'] = indicators;
    return data;
  }

  ResultEntity toEntity() => _$ResultModelToEntity(this);
}

ResultEntity _$ResultModelToEntity(ResultEntity model) {
  return ResultEntity(
    meta: model.meta,
    timestamp: model.timestamp,
    indicators: model.indicators,
  );
}