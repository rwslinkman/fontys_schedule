class Profile {
  String firstName;
  String lastName;
  List<String> attending;

  Profile.fromJson(Map<String, dynamic> json) {
    this.firstName = json["firstName"];
    this.lastName = json["lastName"];
    this.attending = [];
  }
}