import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';
part 'page.g.dart';

@Freezed(genericArgumentFactories: true)
class Page<T> with _$Page<T> {
  const factory Page({
    @JsonKey(name: 'total_items_count') required int totalItemsCount,
    required List<T> items,
  }) = _Page;

  factory Page.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PageFromJson(json, fromJsonT);
}
