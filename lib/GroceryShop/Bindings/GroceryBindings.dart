

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/GroceryController.dart';



class GroceryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GerceryController>(() => GerceryController());
  //  Get.lazyPut<GerceryController>(() => GerceryController(), fenix: false);
  }
}