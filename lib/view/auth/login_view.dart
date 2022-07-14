import '../../resources/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';
  LoginScreen({Key? key}) : super(key: key);
  final _authController = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Start or join a meeting',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/onboarding.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: CustomButton(
                  title: 'Login',
                  onPressed: () async {
                    var res = await _authController.signInWithGoogle(context);
                    if (res) {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
