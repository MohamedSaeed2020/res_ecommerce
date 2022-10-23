import 'package:get/get.dart';

class HomeController extends GetxController {
  /// represents current tab index
  var _index = 0;

  HomeController({int initialIndex = 0}) : _index = initialIndex;

  /// public getter for current tab index
  int get index => _index;

  void jumpToTab(int newValue) {
    if (_index == newValue) {
      return;
    }
    _index = newValue;
    update();
  }

  bool isActive(int currentIndex) => currentIndex == _index;
}
