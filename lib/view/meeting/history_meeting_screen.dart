import 'package:calling_app/resources/firestore_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return ListView.builder(
          itemCount:  (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}'),
                subtitle: Text(
                    'Joined On: ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'),
          );
        });
      },
    );
  }
}
