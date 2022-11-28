import 'package:freezed_annotation/freezed_annotation.dart';

part 'share.freezed.dart';
part 'share.g.dart';

@freezed
class Share with _$Share {
  const factory Share({
    required String pageName,
    required String elementType,
    required String elementId,
    int? position,
  }) = _Share;

  factory Share.fromJson(Map<String, dynamic> json) => _$ShareFromJson(json);
}
