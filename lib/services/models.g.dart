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

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      name: json['name'] as String? ?? '',
      programme: json['programme'] as String? ?? '',
      sem: json['sem'] as String? ?? '',
      tag: json['tag'] as String? ?? '',
      image: json['image'] as String? ?? '',
      percentageCompleted: json['percentageCompleted'] as int? ?? 0,
      author: json['author'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'name': instance.name,
      'programme': instance.programme,
      'sem': instance.sem,
      'tag': instance.tag,
      'image': instance.image,
      'percentageCompleted': instance.percentageCompleted,
      'author': instance.author,
      'description': instance.description,
    };

Notes _$NotesFromJson(Map<String, dynamic> json) => Notes(
      question: json['question'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
    );

Map<String, dynamic> _$NotesToJson(Notes instance) => <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
