import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class NumberProvider extends ChangeNotifier {
  List<int> numbersList = [1, 2, 3];

  updateTheList() {
    int last = numbersList[numbersList.length - 1] + 1;
    numbersList.add(last);
    numbersList[numbersList.length - 1] = last;
    notifyListeners();
  }
}
