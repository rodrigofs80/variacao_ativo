import 'package:json_annotation/json_annotation.dart';
import 'package:variacao_ativo/data/model/current_trading_model.dart';
import 'package:variacao_ativo/domain/entitie/current_tradind_period_entity.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CurrentTradingPeriodModel extends CurrentTradingPeriodEntity {

  @JsonKey(name: 'pre', required: true)
  final CurrentTradingModel pre;

  @JsonKey(name: 'regular', required: true)
  final CurrentTradingModel regular;

  @JsonKey(name: 'post', required: true)
  final CurrentTradingModel post;

  CurrentTradingPeriodModel({
    required this.pre,
    required this.regular,
    required this.post,
  }) : super(pre: pre, regular: regular, post: post);

  factory CurrentTradingPeriodModel.fromJson(Map<dynamic, dynamic> json){
    return CurrentTradingPeriodModel(
        pre: CurrentTradingModel.fromJson(json['pre']),
        regular: CurrentTradingModel.fromJson(json['regular']),
        post: CurrentTradingModel.fromJson(json['post']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pre'] = pre;
    data['regular'] = regular;
    data['post'] = post;
    return data;
  }

  CurrentTradingPeriodEntity toEntity() => _$CurrentTradingPeriodModelToEntity(this);
}

CurrentTradingPeriodEntity _$CurrentTradingPeriodModelToEntity(CurrentTradingPeriodEntity model) {
  return CurrentTradingPeriodEntity(
    pre: model.pre,
    regular: model.regular,
    post: model.post,
  );
}