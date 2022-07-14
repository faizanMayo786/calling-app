import 'dart:math';

import 'package:calling_app/view/meeting/vedio_call_screen.dart';
import 'package:flutter/material.dart';

import '../../resources/jitsi_meet_methods.dart';
import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatefulWidget {
  MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName);
  }

  joinMeeting(BuildContext context) =>
      Navigator.pushNamed(context, VedioCallScreen.routeName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              text: 'New Meeting',
              icon: Icons.videocam,
              onPressed: createNewMeeting,
            ),
            HomeMeetingButton(
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
              onPressed: () => joinMeeting(context),
            ),
            HomeMeetingButton(
              text: 'Schedule',
              icon: Icons.calendar_today,
              onPressed: () {},
            ),
            HomeMeetingButton(
              text: 'Share Screen',
              icon: Icons.arrow_upward_rounded,
              onPressed: () {},
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(
              'Create/Join Meeting with just a Tap!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
