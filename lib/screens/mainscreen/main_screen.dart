import 'package:app/screens/ask_question/ask_question.dart';
import 'package:app/screens/mainscreen/widgets/app_bar.dart';
import 'package:app/screens/mainscreen/widgets/bottom_navigation_items.dart';
import 'package:app/screens/panchang/panchang_screen.dart';
import 'package:app/screens/reports/reports.dart';
import 'package:app/screens/talk_to_astrologer/talk_to_astro_screen.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  /*
  Screens
   */
  final PanchangScreen _panchangScreen =
      const PanchangScreen(key: PageStorageKey("panchangScreen"));
  final TalkToAstrologer _talkToAstrologer =
      const TalkToAstrologer(key: PageStorageKey("astrologerScreen"));
  final Reports _reports = const Reports();
  final AskQuestion _askQuestion = const AskQuestion();

  late final List<Widget> _pages;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    _pages = [_panchangScreen, _talkToAstrologer, _reports, _askQuestion];
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
      body: PageStorage(
        child: _pages[pageIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 10),
        selectedLabelStyle: const TextStyle(fontSize: 10),
        items: getBottomNavBarItems(),
        currentIndex: pageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
