import 'package:calling_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MeetingOption extends StatelessWidget {
  MeetingOption(
      {Key? key,
      required this.text,
      required this.isMute,
      required this.onChanged})
      : super(key: key);
  final String text;
  final bool isMute;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.secondaryColor,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(value: isMute, onChanged: onChanged)
        ],
      ),
    );
  }
}
