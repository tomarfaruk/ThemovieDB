import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 1.obs;

  void onItemSelected(int value) {
    currentIndex(value);
  }
}
