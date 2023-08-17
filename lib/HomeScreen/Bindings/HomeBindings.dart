import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HomeController/Home_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}