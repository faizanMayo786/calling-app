import 'package:calling_app/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeMeetingButton extends StatelessWidget {
  HomeMeetingButton({Key? key, required this.icon,required this.text, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColor.buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),SizedBox(height: 10,),Text(text,style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}
