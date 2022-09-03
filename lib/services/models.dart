import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class User{
  final String id;
  final String displayName;
  final String? programme;
  final String? sem;
  final String email;

  User({
    this.id = '',
    this.displayName = '',
    this.programme = '',
    this.sem = '',
    this.email = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}