import 'package:json_annotation/json_annotation.dart';
import 'package:variacao_ativo/domain/entitie/current_trading_entity.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CurrentTradingModel extends CurrentTradingEntity {

  @JsonKey(name: 'timezone', required: true)
  final String timezone;

  @JsonKey(name: 'start', required: true)
  final int start;

  @JsonKey(name: 'end', required: true)
  final int end;

  @JsonKey(name: 'gmtoffset', required: true)
  final int gmtoffset;

  CurrentTradingModel({
    required this.timezone,
    required this.start,
    required this.end,
    required this.gmtoffset})
      : super(
      timezone: timezone,
      start: start,
      end: end,
      gmtoffset:gmtoffset);

  factory CurrentTradingModel.fromJson(Map<dynamic, dynamic> json){
    return CurrentTradingModel(
        timezone: json['timezone'],
        start: json['start'],
        end: json['end'],
        gmtoffset: json['gmtoffset']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timezone'] = timezone;
    data['start'] = start;
    data['end'] = end;
    data['gmtoffset'] = gmtoffset;
    return data;
  }

  CurrentTradingEntity toEntity() => _$CurrentTradingModelToEntity(this);
}

CurrentTradingEntity _$CurrentTradingModelToEntity(CurrentTradingEntity model) {
  return CurrentTradingEntity(
    timezone: model.timezone,
    start: model.start,
    end: model.end,
    gmtoffset: model.gmtoffset,
  );
}