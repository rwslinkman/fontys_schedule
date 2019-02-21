import 'package:flutter/material.dart';
import 'package:fontys_schedule/assets.dart';
import 'package:fontys_schedule/demo_final/details_screen.dart';
import 'package:fontys_schedule/demo_final/info_section.dart';
import 'package:fontys_schedule/helper/lecture.dart';
import 'package:fontys_schedule/helper/profile.dart';

class ProfilePage extends StatefulWidget {

  final Profile profile;
  final List<Lecture> lectures;

  const ProfilePage({Key key, @required this.profile, this.lectures }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image(
            image: AssetImage(Assets.fontysLogoImage)
          ),
        ),
        _buildTitle(),
        Divider(
            color: Colors.black
        ),
        _buildProfileRow(),
        Divider(
            color: Colors.black
        ),
        _buildAttendingTitle(),
        _buildLectureNamesList()
      ],
    );
  }

  Column _buildAttendingTitle() {
    return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Lectures you are attending",
              style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ]
      );
  }

  Row _buildProfileRow() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.person),
        ),
        InfoSection(
          topText: "${widget.profile.firstName} ${widget.profile.lastName}",
          bottomText: "You",
        )
      ],
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Container(
        child: Text("Welcome, ${widget.profile.firstName}",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold
          ),
        ),
        margin: EdgeInsets.only(left: 8.0, right: 8.0),
      ),
    );
  }

  Widget _buildLectureNamesList() {
    List<String> attendingLectureIds = widget.profile.attending;
    if(attendingLectureIds.isEmpty) {
      // Nothing to display
      return _buildEmptyAttendanceText();
    }

    List<Lecture> attendingLectures = filterLectures(widget.lectures, attendingLectureIds);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: attendingLectures.length,
      itemBuilder: (BuildContext context, int index) {
        final attLecture = attendingLectures[index];

        return ListTile(
          title: _buildAttendingItem(attLecture),
          onTap: (attendingLectures.isEmpty) ? null : () {
            print("attended lecture clicked");
            _navigateToDetails(context, attLecture);
          },
        );
      },
    );
  }

  Widget _buildAttendingItem(Lecture attLecture) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(attLecture.name),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Icon(Icons.info),
        ),

      ],
    );
  }

  Center _buildEmptyAttendanceText() {
    return Center(
      child: Text("Not attending any lectures",
        style: new TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  void _navigateToDetails(BuildContext context, Lecture lectureItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(lecture: lectureItem),
      ),
    );
  }

  filterLectures(List<Lecture> allLectures, List<String> attendingIds) {
    List<Lecture> attending = [];
    for(Lecture lect in allLectures) {
      if(attendingIds.contains(lect.id)) {
        attending.add(lect);
      }
    }
    return attending;
  }
}