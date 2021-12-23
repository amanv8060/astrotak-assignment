import 'package:flutter/widgets.dart';

class MainScreenProvider extends ChangeNotifier {
  int pageIndex = 0;

  update(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
