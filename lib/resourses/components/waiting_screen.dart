import 'package:flutter/material.dart';
import 'package:mediapp/controllers/authcontroller.dart';
import 'package:mediapp/views/home/home.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  void initState() {
    AuthController().isUserAlreadyLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
    });

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
                'https://e7.pngegg.com/pngimages/819/834/png-clipart-red-cross-logo-hospital-medical-sign-health-medical-cross-logo-sign-thumbnail.png'),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
