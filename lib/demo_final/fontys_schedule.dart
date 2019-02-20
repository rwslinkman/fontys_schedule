import 'package:flutter/material.dart';
import 'package:fontys_schedule/demo_final/lectures_page.dart';
import 'package:fontys_schedule/demo_final/profile_page.dart';
import 'package:fontys_schedule/helper/datamodel.dart';
import 'package:fontys_schedule/helper/reader.dart';

class FontysSchedule extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FontysScheduleState();
  }
}

enum Tab {
  profile, schedule
}

class FontysScheduleState extends State<FontysSchedule> {
  Tab activeTab = Tab.profile;
  bool isLoading = true;
  DataModel data;

  @override
  void initState() {
    super.initState();
    
    DataReader reader = new DataReader();
    reader.readData(context).then((model) {
      data = model;
      // Finalize loading
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fontys Lectures',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (isLoading) ? _buildLoading() : _buildScreen(),
    );
  }

  _buildLoading() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fontys Lecture Schedule'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
  
  _buildScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fontys Lecture Schedule'),
      ),
      body: (activeTab == Tab.profile)
          ? ProfilePage(profile: data.profile)
          : LecturesPage(lectures: data.lectures, callback: _onAttendanceChanged),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: Tab.values.indexOf(activeTab),
      onTap: (index) {
        _updateTab(Tab.values[index]);
      },
      items: Tab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            tab == Tab.profile ? Icons.list : Icons.show_chart,
          ),
          title: Text(
            tab == Tab.profile ? "Profile" : "Schedule",
          ),
        );
      }).toList(),
    );
  }

  _updateTab(Tab tab) {
    setState(() {
      activeTab = tab;
    });
  }

  void _onAttendanceChanged(String lectureId, bool isAttending) {
    setState(() {
      List<String> attending = data.profile.attending;
      if(isAttending && !attending.contains(lectureId)) {
        data.profile.attending.add(lectureId);
      }
      if(!isAttending && attending.contains(lectureId)) {
        data.profile.attending.remove(lectureId);
      }
      print(data.profile.attending);
    });
  }
}