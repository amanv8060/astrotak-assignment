import 'package:app/models/panchang.dart';
import 'package:app/screens/ask_question/ask_question.dart';
import 'package:app/screens/mainscreen/widgets/app_bar.dart';
import 'package:app/screens/mainscreen/widgets/bottom_navigation_items.dart';
import 'package:app/screens/panchang/panchang_screen.dart';
import 'package:app/screens/profile/profile_screen.dart';
import 'package:app/screens/reports/reports.dart';
import 'package:app/screens/talktoastro/talk_to_astro_screen.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/utils/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  //declaring classes
  final PanchangScreen _panchangScreen = const PanchangScreen();
  final TalkToAstro _talkToAstro = const TalkToAstro();
  final Reports _reports = const Reports();
  final AskQuestion _askQuestion = const AskQuestion();
  late List<Widget> _pages;

  @override
  void initState() {
    _pages = [_panchangScreen, _talkToAstro, _askQuestion, _reports];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //initializing size config for entire App
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(context),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                "assets/logo.png",
                width: SizeConfig.fitToWidth(50),
                height: SizeConfig.fitToHeight(50),
              ),
              const Center(
                child: Text("Not yet implemented"),
              ),
            ],
          ),
        ),
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: getBottomNavBarItems(),
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
