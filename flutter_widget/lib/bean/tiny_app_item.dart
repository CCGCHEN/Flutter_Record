import 'package:json_annotation/json_annotation.dart';

part 'tiny_app_item.g.dart';


@JsonSerializable()
class AppItem extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'img')
  String img;


  AppItem(this.name, this.url, this.img);

  factory AppItem.fromJson(Map<String, dynamic> srcJson) => _$TinyAppItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TinyAppItemToJson(this);

}