

import 'package:aduadshop/common/SharedPrefHelper.dart';
import 'package:flutter/material.dart';

import '../../HomeScreen/HomeView/HomePageScreen.dart';
import '../../HomeScreen/HomeView/Navbar.dart';
import '../../LifeStyle/LifeStyleScreen/LifeStyleScreen.dart';
import '../../Login/LoginScreen/LoginScreen.dart';
import '../../Vocal For Local/VocalScreen/VocalandScreen.dart';
import '../../common/brand_colors.dart';
import 'GeroceryCatergory.dart';
import 'GroceryShopSceen.dart';
import 'package:dio/dio.dart';

import 'ListDataShowing.dart';

class Gercory extends StatefulWidget {

  const Gercory({Key? key}) : super(key: key);
    @override
  State<Gercory> createState() => _GercoryState();
}

class _GercoryState extends State<Gercory> {
  int _selectedIndex = 1;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    GroceryOrder(),
    LifeStyle(),
    ListData(),
    LoginScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.kred,
        iconTheme: IconThemeData(color: Colors.white),
        title:  Text('AdQuadShop',style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_checkout,color: Colors.white,)),
        ],
      ),
      drawer: NavDrawer(),
      body:  _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: buildMyNavBar(context)
    );
  }
  Container buildMyNavBar(BuildContext context) {
    return Container(

      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Column(
                children: [
                  Image.asset("assets/logo.png",width: 40),
                  Text("Home",style: TextStyle(fontSize:10 ),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Column(
                children: [
                  Image.asset("assets/bottommenu_icon1.png",width: 20),
                  Text("Grocery",style: TextStyle(fontSize:10 ),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Column(
                children: [
                  Image.asset("assets/bottommenu_icon2.png",width: 30),
                  Text("Vocal and Local",style: TextStyle(fontSize:10),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Column(
                children: [
                  Image.asset("assets/bottommenu_icon3.png",width: 30),
                  Text("Lifestyle",style: TextStyle(fontSize:10),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex =4;
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Column(
                children: [
                  Image.asset("assets/bottommenu_icon4.png",width: 30),
                  Text("My Account",style: TextStyle(fontSize:10),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
