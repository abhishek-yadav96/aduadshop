

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/LifeStyleController.dart';

class LifeStyleBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LifeStyleController>(() => LifeStyleController());
  }
}