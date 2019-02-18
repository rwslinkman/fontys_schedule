import 'package:flutter/material.dart';
import 'package:fontys_schedule/assets.dart';
import 'package:fontys_schedule/helper/datamodel.dart';
import 'package:fontys_schedule/helper/reader.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  String name = "";

  @override
  void initState() {
    super.initState();

    DataReader reader = new DataReader();
    reader.readData(context).then((model) {
      // Update the widget
      setState(() {
        name = "${model.profile.firstName} ${model.profile.lastName}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fontys Lecture Schedule'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(
                image: AssetImage(Assets.fontysLogoImage)
              ),
            ),
            Text(
              'Welcome, $name',
            ),
            RaisedButton(
              onPressed: () => null,
              child: Text("Open schedule"),
            )
          ],
        ),
      ),
    );
  }

}