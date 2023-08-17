

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/Vocal and Local.dart';
class VocalandLocalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VocalAndLocal>(() => VocalAndLocal());
  }
}