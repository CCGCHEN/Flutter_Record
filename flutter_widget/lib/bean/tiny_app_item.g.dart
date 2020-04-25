// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tiny_app_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppItem _$TinyAppItemFromJson(Map<String, dynamic> json) {
  return AppItem(
    json['name'] as String,
    json['url'] as String,
    json['img'] as String,
  );
}

Map<String, dynamic> _$TinyAppItemToJson(AppItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'img': instance.img,
    };
