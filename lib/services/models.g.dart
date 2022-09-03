// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      programme: json['programme'] as String? ?? '',
      sem: json['sem'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'programme': instance.programme,
      'sem': instance.sem,
      'email': instance.email,
    };
