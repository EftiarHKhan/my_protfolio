import 'package:get/get.dart';
import 'package:my_protfolio/Controller/user_name_controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<usercontroller>(usercontroller());
  }
}