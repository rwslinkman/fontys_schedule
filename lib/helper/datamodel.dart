import 'package:fontys_schedule/helper/lecture.dart';
import 'package:fontys_schedule/helper/profile.dart';

class DataModel {
  Profile profile;
  List<Lecture> lectures;

  DataModel.fromJson(Map<String, dynamic> json) {
    this.profile = Profile.fromJson(json["profile"]);
    this.lectures = [];
    json["lectures"].forEach((lecture) => this.lectures.add(Lecture.fromJson(lecture)));
  }
}