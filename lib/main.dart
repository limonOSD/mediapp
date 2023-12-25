import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mediapp/consts/fonts.dart';
import 'package:mediapp/firebase_options.dart';
import 'package:mediapp/resourses/components/waiting_screen.dart';

import 'package:mediapp/views/login_view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.nunito),
      home: const WaitingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
