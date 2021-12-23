import 'package:flutter/widgets.dart';

class MainScreenProvider extends ChangeNotifier {
  int pageIndex = 1;

  update(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
