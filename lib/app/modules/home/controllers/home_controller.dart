import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    select();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void select() {
    print('sd');
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
