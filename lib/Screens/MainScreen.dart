import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srab/Screens/AddPost.dart';
import 'package:srab/Screens/Home.dart';
import 'package:srab/Screens/Profile.dart';
import 'package:srab/Utils/CustomColors.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  navigationtaped(int page) {
    pageController.jumpToPage(page);
  }

  void pagechanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [Home(), AddPost(), ProfileScreen()],
        controller: pageController,
        onPageChanged: pagechanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: navigationtaped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _page == 0 ? CustomColor.cosmic_red : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo,
                color: _page == 1 ? CustomColor.cosmic_red : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _page == 2 ? CustomColor.cosmic_red : Colors.grey),
            label: '',
          ),
        ],
      ),
    );
  }
}
