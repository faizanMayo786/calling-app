import 'package:calling_app/resources/auth_controller.dart';
import 'package:calling_app/view/meeting/history_meeting_screen.dart';
import 'package:calling_app/view/meeting/meeting_screen.dart';
import 'package:calling_app/view/widgets/custom_button.dart';

import '../../utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  
  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    CustomButton(title: 'Log Out', onPressed:()=> AuthMethods().signOut())
  ];


  onPageChanged(int value) {
    setState(() {
      _selectedPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meet & Chat'),
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
        ),
        body: pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onPageChanged,
          currentIndex: _selectedPage,
          unselectedFontSize: 14,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meeting'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ],
        ));
        
  }
}
