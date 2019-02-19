import 'package:flutter/material.dart';
import 'package:fontys_schedule/assets.dart';
import 'package:fontys_schedule/helper/profile.dart';

class ProfilePage extends StatefulWidget {

  final Profile profile;

  const ProfilePage({Key key, @required this.profile }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return buildPage();
  }

  Center buildPage() {
    return Center(
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
            'Welcome, ${widget.profile.firstName}',
          ),
          RaisedButton(
            onPressed: () => null,
            child: Text("Open schedule"),
          )
        ],
      ),
    );
  }

}