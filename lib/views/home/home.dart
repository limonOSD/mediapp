import 'package:flutter/material.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:mediapp/views/appoinment_view/appoinment_view.dart';
import 'package:mediapp/views/catagory_view/catagory_view.dart';
import 'package:mediapp/views/home/home_view.dart';
import 'package:mediapp/views/login_view/login_view.dart';
import 'package:mediapp/views/settings_view/setings_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    const HomeView(),
    const AppoinmentView(),
    const CatagoryView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.whiteColor,
          selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
          selectedIconTheme: IconThemeData(color: AppColors.whiteColor),
          backgroundColor: AppColors.blueColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_online), label: 'Appointment'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Catagory'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
