import 'package:flutter/material.dart';

class LecturesPage extends StatefulWidget {

  final String title;

  const LecturesPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new LecturesPageState();
}

class LecturesPageState extends State<LecturesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}