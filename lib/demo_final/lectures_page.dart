import 'package:flutter/material.dart';
import 'package:fontys_schedule/demo_final/details_screen.dart';
import 'package:fontys_schedule/demo_final/lecture_item.dart';
import 'package:fontys_schedule/helper/lecture.dart';

class LecturesPage extends StatefulWidget {

  final List<Lecture> lectures;
  final List<String> attendingIds;
  final Function(String, bool) callback;

  const LecturesPage({Key key, this.lectures, this.attendingIds, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new LecturesPageState();
}

class LecturesPageState extends State<LecturesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _buildList()
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }

  ListView _buildList() {
    final lectureList = widget.lectures;

    return ListView.builder(
      itemCount: lectureList.length,
      itemBuilder: (BuildContext context, int index) {
        // Grab item
        final lectureItem = lectureList[index];
        final bool checkInitially = widget.attendingIds.contains(lectureItem.id);
        // Build tile
        return ListTile(
          title: LectureItem(
              lecture: lectureItem,
              initialCheckState: checkInitially,
              callback: widget.callback
          ),
          onTap: () {
            print("item clicked");
            _navigateToDetails(context, lectureItem);
          },
        );
      },
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
}