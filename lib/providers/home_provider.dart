import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  int _sliderPinnedIndex = 0;

  get sliderPinnedIndex => _sliderPinnedIndex;

  setSliderPinnedIndex(int index) {
    _sliderPinnedIndex = index;
    notifyListeners();
  }
}
