import 'package:json_annotation/json_annotation.dart';
import 'package:variacao_ativo/src/data/model/current_trading_model.dart';
import 'package:variacao_ativo/src/data/model/current_trading_period_model.dart';
import 'package:variacao_ativo/src/domain/entitie/meta_entity.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class MetaModel extends MetaEntity {

  @JsonKey(name: 'currency', required: true)
  final String currency;

  @JsonKey(name: 'symbol', required: true)
  final String symbol;

  @JsonKey(name: 'exchangeName', required: true)
  final String exchangeName;

  @JsonKey(name: 'instrumentType', required: true)
  final String instrumentType;

  @JsonKey(name: 'firstTradeDate', required: true)
  final int firstTradeDate;

  @JsonKey(name: 'regularMarketTime', required: true)
  final int regularMarketTime;

  @JsonKey(name: 'gmtoffset', required: true)
  final int gmtoffset;

  @JsonKey(name: 'timezone', required: true)
  final String timezone;

  @JsonKey(name: 'exchangeTimezoneName', required: true)
  final String exchangeTimezoneName;

  @JsonKey(name: 'regularMarketPrice', required: true)
  final double regularMarketPrice;

  @JsonKey(name: 'chartPreviousClose', required: true)
  final double chartPreviousClose;

  @JsonKey(name: 'previousClose', required: true)
  final double previousClose;

  @JsonKey(name: 'scale', required: true)
  final int scale;

  @JsonKey(name: 'priceHint', required: true)
  final int priceHint;

  @JsonKey(name: 'currentTradingPeriod', required: true)
  final CurrentTradingPeriodModel currentTradingPeriod;

  @JsonKey(name: 'tradingPeriods', required: true)
  final List<CurrentTradingModel> tradingPeriods;

  @JsonKey(name: 'dataGranularity', required: true)
  final String dataGranularity;

  @JsonKey(name: 'range', required: true)
  final String range;

  @JsonKey(name: 'validRanges', required: true)
  final List<String> validRanges;

  MetaModel({
    required this.currency,
    required this.symbol,
    required this.exchangeName,
    required this.instrumentType,
    required this.firstTradeDate,
    required this.regularMarketTime,
    required this.gmtoffset,
    required this.timezone,
    required this.exchangeTimezoneName,
    required this.regularMarketPrice,
    required this.chartPreviousClose,
    required this.previousClose,
    required this.scale,
    required this.priceHint,
    required this.currentTradingPeriod,
    required this.tradingPeriods,
    required this.dataGranularity,
    required this.range,
    required this.validRanges,
  }) :  super(
    currency: currency,
    symbol: symbol,
    exchangeName: exchangeName,
    instrumentType: instrumentType,
    firstTradeDate: firstTradeDate,
    regularMarketTime: regularMarketTime,
    gmtoffset: gmtoffset,
    timezone: timezone,
    exchangeTimezoneName: exchangeTimezoneName,
    regularMarketPrice: regularMarketPrice,
    chartPreviousClose: chartPreviousClose,
    previousClose: previousClose,
    scale: scale,
    priceHint: priceHint,
    currentTradingPeriod: currentTradingPeriod,
    tradingPeriods: tradingPeriods,
    dataGranularity: dataGranularity,
    range: range,
    validRanges: validRanges,
  );

  factory MetaModel.fromJson(Map<dynamic, dynamic> json){
    List<CurrentTradingModel> temp = [];
    for(var resultEntity in json['tradingPeriods']){
      for(var re in resultEntity){
        temp.add(CurrentTradingModel.fromJson(re));
      }
      break;
    }
    List<String> ranges = [];
    for(var st in json['validRanges']){
      ranges.add(st);
    }
    return MetaModel(
      currency: json['currency'],
      symbol: json['symbol'],
      exchangeName: json['exchangeName'],
      instrumentType: json['instrumentType'],
      firstTradeDate: json['firstTradeDate'],
      regularMarketTime: json['regularMarketTime'],
      gmtoffset: json['gmtoffset'],
      timezone: json['timezone'],
      exchangeTimezoneName: json['exchangeTimezoneName'],
      regularMarketPrice: json['regularMarketPrice'],
      chartPreviousClose: json['chartPreviousClose'],
      previousClose: json['previousClose'],
      scale: json['scale'],
      priceHint: json['priceHint'],
      currentTradingPeriod: CurrentTradingPeriodModel.fromJson(json['currentTradingPeriod']),
      tradingPeriods: temp,
      dataGranularity: json['dataGranularity'],
      range: json['range'],
      validRanges: ranges,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['symbol'] = symbol;
    data['exchangeName'] = exchangeName;
    data['instrumentType'] = instrumentType;
    data['firstTradeDate'] = firstTradeDate;
    data['regularMarketTime'] = regularMarketTime;
    data['gmtoffset'] = gmtoffset;
    data['timezone'] = timezone;
    data['exchangeTimezoneName'] = exchangeTimezoneName;
    data['regularMarketPrice'] = regularMarketPrice;
    data['chartPreviousClose'] = chartPreviousClose;
    data['previousClose'] = previousClose;
    data['scale'] = scale;
    data['priceHint'] = priceHint;
    data['currentTradingPeriod'] = currentTradingPeriod;
    data['tradingPeriods'] = tradingPeriods;
    data['dataGranularity'] = dataGranularity;
    data['range'] = range;
    data['validRanges'] = validRanges;
    return data;
  }

  MetaEntity toEntity() => _$MetaModelToEntity(this);
}

MetaEntity _$MetaModelToEntity(MetaEntity model) {
  return MetaEntity(
    currency: model.currency,
    symbol: model.symbol,
    exchangeName: model.exchangeName,
    instrumentType: model.instrumentType,
    firstTradeDate: model.firstTradeDate,
    regularMarketTime: model.regularMarketTime,
    gmtoffset: model.gmtoffset,
    timezone: model.timezone,
    exchangeTimezoneName: model.exchangeTimezoneName,
    regularMarketPrice: model.regularMarketPrice,
    chartPreviousClose: model.chartPreviousClose,
    previousClose: model.previousClose,
    scale: model.scale,
    priceHint: model.priceHint,
    currentTradingPeriod: model.currentTradingPeriod,
    tradingPeriods: model.tradingPeriods,
    dataGranularity: model.dataGranularity,
    range: model.range,
    validRanges: model.validRanges,
  );
}