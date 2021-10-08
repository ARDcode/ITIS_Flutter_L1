import 'package:json_annotation/json_annotation.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat {
  Cat({
    required this.id,
    this.url,
    required this.width,
    required this.height,
  });

  String id;
  String? url;
  int width;
  int height;

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);
}
