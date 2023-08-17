


import 'package:aduadshop/Routes/routes_name.dart';
import 'package:get/get.dart';
import '../GroceryShop/Bindings/GroceryBindings.dart';
import '../GroceryShop/GroceryScreen/GeroceryCatergory.dart';
import '../GroceryShop/GroceryScreen/GroceryShopSceen.dart';
import '../GroceryShop/GroceryScreen/ListDataShowing.dart';
import '../HomeScreen/Bindings/HomeBindings.dart';
import '../HomeScreen/HomeView/Homelistdate.dart';
import '../HomeScreen/HomeView/MainHomeScreen.dart';
import '../LifeStyle/Bindings/LifeStyleBindings.dart';
import '../LifeStyle/LifeStyleScreen/LifeStyleScreen.dart';
import '../Login/Bindings/LoginBindings.dart';
import '../Vocal For Local/Bindings/Vocal and Local.dart';
import '../Vocal For Local/VocalScreen/VocalandScreen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: RoutesName.home,
      page: () => MainHomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => homelistData(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.vocalandlocal,
      page: () => workfoplocal(),
      binding: VocalandLocalBindings(),
    ),
    GetPage(
      name: RoutesName.lifeStyle,
      page: () =>LifeStyle(),
      binding: LifeStyleBindings(),
    ),
    GetPage(
      name: RoutesName.login,
      page: () => workfoplocal(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesName.grocery,
      page: () => GroceryOrder(),
      binding: GroceryBindings(),
    ),
    GetPage(
      name: RoutesName.listData,
      page: () => ListData(),
      binding: GroceryBindings(),
    ),
  ];
  }

