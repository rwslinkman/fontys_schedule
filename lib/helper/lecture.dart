class Lecture {
  String id;
  String name;
  String lecturer;
  String room;
  String startsAt;

  Lecture.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.lecturer = json["lecturer"];
    this.room = json["room"];
    this.startsAt = json["startsAt"];
  }
}