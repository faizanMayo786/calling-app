import 'package:calling_app/resources/auth_controller.dart';
import 'package:calling_app/resources/firestore_methods.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting({
    required String roomName,
    String name = '',
    bool isMuted = false,
    bool isVedio = false,
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name.isEmpty ? _authMethods.user.displayName : name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL! // or .png
        ..audioMuted = isMuted
        ..videoMuted = isVedio;
      await _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
