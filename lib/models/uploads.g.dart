// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadImpl _$$UploadImplFromJson(Map<String, dynamic> json) => _$UploadImpl(
      id: (json['id'] as num).toInt(),
      filename: json['filename'] as String,
      url: json['full_url'] as String,
    );

Map<String, dynamic> _$$UploadImplToJson(_$UploadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'full_url': instance.url,
    };
