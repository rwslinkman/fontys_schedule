import 'package:flutter/material.dart';
import 'package:fontys_schedule/helper/lecture.dart';

class LectureItem extends StatefulWidget {

  final Lecture lecture;

  LectureItem({@required this.lecture});

  @override
  State<StatefulWidget> createState() {
    return LectureItemState();
  }

}

class LectureItemState extends State<LectureItem> {

  bool isAttending = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildInfoSection(),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text("${widget.lecture.startsAt}",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
              ),
            ),
          ),
          Checkbox(
            value: isAttending,
            onChanged: (_) {
              print("attendance changed");
              setState(() {
                isAttending = !isAttending;
              });
            },
          ),
          Divider()
        ],
      ),
      margin: EdgeInsets.all(8.0),
    );
  }

  Expanded _buildInfoSection() {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("${widget.lecture.name}",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
            ),
            Text("${widget.lecture.lecturer} - ${widget.lecture.room}",
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
              ),
            ),
          ]
      ),
    );
  }

}