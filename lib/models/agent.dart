import 'package:equatable/equatable.dart';

import 'agent/skill.dart';
import 'agent/availbility.dart';
import 'agent/images.dart';
import 'agent/language.dart';

class Agent with EquatableMixin {
  Agent({
    required this.id,
    required this.urlSlug,
    this.namePrefix,
    required this.firstName,
    required this.lastName,
    required this.aboutMe,
    this.profliePicUrl,
    required this.experience,
    required this.languages,
    required this.minimumCallDuration,
    required this.minimumCallDurationCharges,
    required this.additionalPerMinuteCharges,
    required this.isAvailable,
    this.rating,
    required this.skills,
    required this.isOnCall,
    required this.freeMinutes,
    required this.additionalMinute,
    required this.images,
    required this.availability,
  });

  int id;
  String urlSlug;
  String? namePrefix;
  String firstName;
  String lastName;
  String? aboutMe;
  String? profliePicUrl;
  double experience;
  List<Language> languages;
  int minimumCallDuration;
  double minimumCallDurationCharges;
  double additionalPerMinuteCharges;
  bool isAvailable;
  double? rating;
  List<Skill> skills;
  bool isOnCall;
  int freeMinutes;
  int additionalMinute;
  Images images;
  Availability? availability;

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        id: json["id"],
        urlSlug: json["urlSlug"],
        namePrefix: json["namePrefix"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        aboutMe: json["aboutMe"],
        profliePicUrl: json["profliePicUrl"],
        experience: json["experience"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"],
        minimumCallDurationCharges: json["minimumCallDurationCharges"],
        additionalPerMinuteCharges: json["additionalPerMinuteCharges"],
        isAvailable: json["isAvailable"],
        rating: json["rating"],
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        isOnCall: json["isOnCall"],
        freeMinutes: json["freeMinutes"],
        additionalMinute: json["additionalMinute"],
        images: Images.fromJson(json["images"]),
        availability: json["availability"] == null
            ? null
            : Availability.fromJson(json["availability"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix,
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe,
        "profliePicUrl": profliePicUrl,
        "experience": experience,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "rating": rating,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images.toJson(),
        "availability": availability?.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        urlSlug,
        namePrefix,
        firstName,
        lastName,
        aboutMe,
        profliePicUrl,
        experience,
        languages,
        minimumCallDuration,
        minimumCallDurationCharges,
        additionalPerMinuteCharges,
        isAvailable,
        rating,
        skills,
        isOnCall,
        freeMinutes,
        additionalMinute,
        images,
        availability
      ];

  String getFormattedName() {
    if (namePrefix == null || namePrefix!.isEmpty) {
      return firstName + " " + lastName;
    } else {
      return namePrefix! + " " + firstName + " " + lastName;
    }
  }

  @override
  bool? get stringify => true;
}
