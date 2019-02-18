import 'package:flutter/material.dart';
import 'package:fontys_schedule/assets.dart';
import 'package:fontys_schedule/helper/datamodel.dart';
import 'dart:convert' as JSON;

class DataReader {

    Future<DataModel> readData(BuildContext context) async {
      String data = await DefaultAssetBundle.of(context).loadString(Assets.scheduleDataFile);
      Map<String, dynamic> decodedJson = JSON.jsonDecode(data);
      return DataModel.fromJson(decodedJson);
    }
}