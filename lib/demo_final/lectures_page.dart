import 'package:flutter/material.dart';
import 'package:fontys_schedule/helper/lecture.dart';

class LecturesPage extends StatefulWidget {

  final List<Lecture> lectures;

  const LecturesPage({Key key, this.lectures}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new LecturesPageState();
}

class LecturesPageState extends State<LecturesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildList()
//      Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Text(
//            'You have pushed the button this many times:',
//          ),
//        ],
//      ),
    );
  }

  ListView _buildList() {
    final lectureList = widget.lectures;

    return ListView.builder(
      itemCount: lectureList.length,
      itemBuilder: (BuildContext context, int index) {
        final lecture = lectureList[index];

        // TODO: Build lecture item
        return Text(lecture.name);
      },
    );
  }
}