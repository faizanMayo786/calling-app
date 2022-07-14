import '../../utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: AppColor.buttonColor,
            minimumSize: const Size(double.infinity, 50),
            shape: const StadiumBorder()),
        child: Text(
          title,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
