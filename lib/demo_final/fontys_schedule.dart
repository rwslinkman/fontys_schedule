import 'package:flutter/material.dart';
import 'package:fontys_schedule/assets.dart';
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
        primarySwatch: Colors.deepPurple,
        primaryColor: Assets.fontysPurple,
        canvasColor: Colors.white,
        textTheme: TextTheme(
          headline: TextStyle(
              color: Assets.fontysPurple,
              fontSize: 24.0,
              fontWeight: FontWeight.bold
          ),
          title: TextStyle(
            color: Colors.black,
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
          subtitle: TextStyle(
              color: Colors.black,
              fontSize: 16.0
          )
        ),
        iconTheme: IconThemeData(
          color: Assets.fontysPurple
        ),
        dividerColor: Assets.fontysPurple
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
          ? ProfilePage(profile: data.profile, lectures: data.lectures)
          : LecturesPage(lectures: data.lectures, attendingIds: data.profile.attending, callback: _onAttendanceChanged),
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
    });
  }
}