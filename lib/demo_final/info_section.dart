import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final String topText;
  final String bottomText;

  const InfoSection({Key key, this.topText, this.bottomText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(topText,
              style: new TextStyle(
                color: Colors.black,
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
            ),
            Text(bottomText,
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