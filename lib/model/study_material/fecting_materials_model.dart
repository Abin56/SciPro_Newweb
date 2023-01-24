//     final StudyMaterialsFecting = StudyMaterialsFectingFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

StudyMaterialsFecting StudyMaterialsFectingFromJson(String str) =>
    StudyMaterialsFecting.fromJson(json.decode(str));

String StudyMaterialsFectingToJson(StudyMaterialsFecting data) =>
    json.encode(data.toJson());

class StudyMaterialsFecting {
  StudyMaterialsFecting({
    required this.id,
    required this.videoImage,
    required this.videoName,
    required this.videoPath,
    required this.course,
  
  });

  String id;
  String videoImage;
  String videoName;
  String videoPath;
  String course;
 

  factory StudyMaterialsFecting.fromJson(Map<String, dynamic> json) =>
      StudyMaterialsFecting(
        id: json["id"] ?? '',
        videoImage: json["videoImage"] ?? '',
        videoName: json["videoName"] ?? '',
        videoPath: json["videoPath"] ?? "",
        course: json["course"] ?? "",
   
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "videoImage": videoImage,
        "videoName": videoName,
        "videoPath": videoPath,
        "course": course,
    
      };
}
