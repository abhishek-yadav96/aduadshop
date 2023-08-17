import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../GroceryShop/GroceryScreen/GeroceryCatergory.dart';
import '../../GroceryShop/GroceryScreen/GroceryShopSceen.dart';
import '../../GroceryShop/GroceryScreen/Groceryshop.dart';
import '../../LifeStyle/LifeStyleScreen/LifeStyleScreen.dart';
import '../../Login/LoginScreen/LoginScreen.dart';
import '../../Routes/routes_name.dart';
import '../../Vocal For Local/VocalScreen/VocalandScreen.dart';
import 'HomePageScreen.dart';

class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
            child: Row(
              children: [
                Container(
                  child: Text(
                    'My Account',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                ),
                Spacer(),
                Container(child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.close))),
              ],
            ),
          ),
          SizedBox(
            height: 120.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[300]),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: 900,
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      // color: Colors.blueAccent,
                      // margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.red,
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: FittedBox(
                              child: Text(
                                'AY',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red),
                              ),
                            ),
                          ),
                          Container(
                            //color: Colors.black,
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: FittedBox(
                              child: Text(
                                'ay@gmail.com',
                                style: TextStyle(
                                    fontSize: 13,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    '+91',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '9648822608',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    Container(
                      width: 70,
                      // color: Colors.cyan,
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {

                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 18),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          'SHOP BY CATEGORY',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                       /*   Get.to(Gercory(),);*/
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                                child: Text('Grocery',style: TextStyle(
                                  fontSize: 18,color: Colors.grey[700]
                                ),),
                              ),
                              Spacer(),
                              Container(
                                child: Icon(Icons.arrow_forward_ios_sharp,size: 20,color:  Colors.grey[700],),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(RoutesName.vocalandlocal);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                                child: Text('Vocal For Local',style: TextStyle(
                                    fontSize: 18,color: Colors.grey[700]
                                ),),
                              ),
                              Spacer(),
                              Container(
                                child: Icon(Icons.arrow_forward_ios_sharp,size: 20,color:  Colors.grey[700],),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                              child: Text('Lifestyle',style: TextStyle(
                                  fontSize: 18,color: Colors.grey[700]
                              ),),
                            ),
                            Spacer(),
                            Container(
                              child: Icon(Icons.arrow_forward_ios_sharp,size: 20,color:  Colors.grey[700],),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                              child: Text('Grocery Shop',style: TextStyle(
                                  fontSize: 18,color: Colors.grey[700]
                              ),),
                            ),
                            Spacer(),
                            Container(
                              child: Icon(Icons.arrow_forward_ios_sharp,size: 20,color:  Colors.grey[700],),
                            ),

                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                              child: Text('My Coupons / Deals',style: TextStyle(
                                  fontSize: 18,color: Colors.grey[700]
                              ),),
                            ),
                            Spacer(),
                            Container(
                              child: Icon(Icons.arrow_forward_ios_sharp,size: 20,color:  Colors.grey[700],),
                            ),

                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                              child: Text('Contact Us',style: TextStyle(
                                  fontSize: 18,color: Colors.grey[700]
                              ),),
                            ),
                            Spacer(),
                            Container(
                              child: Icon(Icons.arrow_forward_ios_sharp,size: 20,color:  Colors.grey[700],),
                            ),

                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
