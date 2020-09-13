import 'package:json_annotation/json_annotation.dart';

part 'game_item.g.dart';


@JsonSerializable()
class GameItem extends Object {

  @JsonKey(name: 'baseInfo')
  BaseInfo baseInfo;

  @JsonKey(name: 'cpInfo')
  CpInfo cpInfo;

  @JsonKey(name: 'optInfo')
  OptInfo optInfo;

  @JsonKey(name: 'evaluation')
  Evaluation evaluation;

  GameItem(this.baseInfo,this.cpInfo,this.optInfo,this.evaluation,);

  factory GameItem.fromJson(Map<String, dynamic> srcJson) => _$GameItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GameItemToJson(this);

}