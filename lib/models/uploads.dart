import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploads.freezed.dart';
part 'uploads.g.dart';

@freezed
class Upload with _$Upload {
  const factory Upload({
    required int id,
    required String filename,
    @JsonKey(name: 'full_url') required String url,
  }) = _Upload;

  factory Upload.fromJson(Map<String, Object?> json) => _$UploadFromJson(json);
}
