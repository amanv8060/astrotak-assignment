import 'package:app/provider/main_screen_provider.dart';
import 'package:app/screens/ask_question/ask_question.dart';
import 'package:app/screens/mainscreen/widgets/app_bar.dart';
import 'package:app/screens/mainscreen/widgets/bottom_navigation_items.dart';
import 'package:app/screens/panchang/panchang_screen.dart';
import 'package:app/screens/reports/reports.dart';
import 'package:app/screens/talk_to_astrologer/talk_to_astro_screen.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenProvider _mainScreenProvider = MainScreenProvider();

  //declaring classes
  final List<Widget> _pages = const [
    PanchangScreen(),
    TalkToAstrologer(),
    Reports(),
    AskQuestion()
  ];

  @override
  Widget build(BuildContext context) {
    //initializing size config for entire App
    SizeConfig().init(context);
    return ChangeNotifierProvider.value(
        value: _mainScreenProvider,
        child: Consumer<MainScreenProvider>(
          builder: (context, _provider, _) {
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
              body: Consumer<MainScreenProvider>(
                  builder: (context, _provider, _) {
                return _pages[_provider.pageIndex];
              }),
              bottomNavigationBar: BottomNavigationBar(
                showUnselectedLabels: true,
                showSelectedLabels: true,
                items: getBottomNavBarItems(),
                currentIndex: _provider.pageIndex,
                selectedItemColor: Colors.amber[800],
                onTap: (index) {
                  _provider.update(index);
                },
                type: BottomNavigationBarType.fixed,
              ),
            );
          },
        ));
  }
}
