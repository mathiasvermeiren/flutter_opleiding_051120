import 'package:flutter/material.dart';
import 'package:flutter_opleiding_051120/pages/sessions_page.dart';
import 'package:flutter_opleiding_051120/pages/sign_up_page.dart';
import 'package:flutter_opleiding_051120/pages/speakers_page.dart';

class MainScreen extends StatefulWidget {
  final int index;

  MainScreen({this.index});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentNavigationIndex;
  Widget currentPage;
  List<Widget> pages;

  SessionsPage sessionsPage;
  SpeakersPage speakersPage;
  SignUpPage signUpPage;

  @override
  void initState() {
    sessionsPage = SessionsPage();
    speakersPage = SpeakersPage();
    signUpPage = SignUpPage();

    pages = [sessionsPage, speakersPage, signUpPage];

    currentPage = pages[widget.index];
    currentNavigationIndex = widget.index;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Welcome to HAXX'),
            Text(
              ' _',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ],
        ),
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentNavigationIndex = index;
            currentPage = pages[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentNavigationIndex,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            title: Text('Sessions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Speakers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
