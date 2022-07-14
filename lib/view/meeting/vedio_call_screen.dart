import 'package:calling_app/resources/auth_controller.dart';
import 'package:calling_app/resources/jitsi_meet_methods.dart';
import 'package:calling_app/utils/colors.dart';
import 'package:calling_app/view/widgets/meeting_options.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class VedioCallScreen extends StatefulWidget {
  static String routeName = '/vedio-call';
  VedioCallScreen({Key? key}) : super(key: key);

  @override
  State<VedioCallScreen> createState() => _VedioCallScreenState();
}

class _VedioCallScreenState extends State<VedioCallScreen> {
  final AuthMethods _authMethods = AuthMethods();

  TextEditingController idContoller = TextEditingController();

  TextEditingController nameContoller = TextEditingController();

  bool isAudioMuted = true;

  bool isVedioMuted = true;

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: idContoller.text,
      name: nameContoller.text,
      isMuted: isAudioMuted,
      isVedio: isVedioMuted,
    );
  }

  onVedioMuted(bool value) {
    setState(() {
      isVedioMuted = value;
    });
  }

  onAudioMuted(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    idContoller.dispose();

    nameContoller.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    nameContoller.text = _authMethods.user.displayName!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Meeting'),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: idContoller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: AppColor.secondaryColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: nameContoller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: AppColor.secondaryColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Join',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChanged: (value) => onAudioMuted(value),
          ),
          MeetingOption(
            text: 'Turn Off My Vedio',
            isMute: isVedioMuted,
            onChanged: (value) => onVedioMuted(value),
          ),
        ],
      ),
    );
  }
}
