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

@JsonSerializable()
class Subject{
  final String name;
  final String programme;
  final String sem;
  final String tag;
  final String image;
  final int percentageCompleted;
  final String author;
  final String description;
   Subject({
    this.name = '',
    this.programme = '',
    this.sem = '',
    this.tag = '',
    this.image = '',
    this.percentageCompleted = 0,
    this.author = '',
    this.description = '',
  });
  
  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class Notes{
  final String question;
  final String answer;

  Notes({
    this.question = '',
    this.answer = '',
  });

  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);
  Map<String, dynamic> toJson() => _$NotesToJson(this);
}