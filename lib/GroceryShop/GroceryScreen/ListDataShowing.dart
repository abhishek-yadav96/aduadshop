import 'package:aduadshop/common/brand_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../../HomeScreen/HomeView/Navbar.dart';
import 'ViewPageProdcet.dart';

class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  var somedata = Get.arguments;
  List<dynamic> returnproducts = [];

  var data = "";

  Future<void> listProduct() async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .post("https://adquadshop.com/api/grocery-product-list", data: {
        "vandorid": somedata[0]["vendor_id"],
        "subcategoryid": somedata[0]["subcategory_id"],
        "childcategory": "",
        "brand": "",
        "foodtype": "",
        "price": "0,5000",
        "todaydeals": "",
        "Offer": "",
        "payondelivery": "",
        "discount": "0,100",
        "searchproduct": "",
        "recordslimit": 20,
        "page": 1
      });
      var api = response.data["success"];

      print("responese4${api}");
      if (response.statusCode == 200) {
        setState(() {
          returnproducts = api["returnproducts"];
          //   productiamges=api["productiamges"];
          print("helo${returnproducts}");
        });
      }
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listProduct(); //int name = int.parse(somedata["vendor_id"]);
    print(somedata);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.kred,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Aao Carry Home',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/white_star.png',
                        width: 15,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      child: Text(
                        '4.5',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        'Write a review',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      drawer: NavDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 80,
              color: BrandColors.kPinkyWhite,
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: BrandColors.kWhite,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 250,
                          margin: EdgeInsets.only(
                            left: 2,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Search any Shop / Product / Category'),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.search_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    nameValue(),
                    Filter(),
                    Container(
                      child: Column(
                        children: [
                          for (int i = 0; i < returnproducts.length; i++)
                            Container(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(ViewWhole(), arguments: [
                                        {
                                          "vander_id": returnproducts[i]
                                              ["vander_id"],
                                          "productid": returnproducts[i]
                                              ["productid"],
                                          "child_category_id": returnproducts[i]
                                              ["sub_category_id"],
                                        }
                                      ]);
                                    },
                                    child: Container(
                                      //  color: Colors.red,
                                      height: 250,
                                      margin: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Stack(
                                            children: [
                                              Positioned(
                                                  top: 30,
                                                  right: 0,
                                                  left: 0,
                                                  child: Container(
                                                    // color: Colors.red,
                                                    height: 210,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        child: Image.network(
                                                          'https://www.adquadshop.com/public/${returnproducts[i]["productiamges"][0]["image_490X475"]}',
                                                          width: 200,
                                                          height: 200,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                              Positioned(
                                                top: 10,
                                                left: 0,
                                                right: 120,
                                                child: Container(
                                                  height: 60,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      //color: Colors.blue,
                                                      image:
                                                          new DecorationImage(
                                                    image: new AssetImage(
                                                        "assets/offertag.png"),
                                                    fit: BoxFit.fill,
                                                  )),
                                                  child: Container(
                                                    margin: EdgeInsets.all(10),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          '${returnproducts[i]["percentage"].toStringAsFixed(1)}%',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text('off',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 9))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Container(
                                            // color: Colors.grey,
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 40, 0, 0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    returnproducts[i]
                                                        ["productname"],
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          '₹${returnproducts[i]["discounted_price"]}'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '₹${returnproducts[i]["price"]}',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            fontSize: 13),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 0, 0, 0),
                                                  margin:
                                                      EdgeInsets.only(left: 30),
                                                  //   color: Colors.red,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.blue,
                                                    ),
                                                    onPressed: () {},
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Image.asset(
                                                          'assets/whitecart.png',
                                                          width: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          'Add',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 10, 0),
                                                  alignment: Alignment.center,
                                                  //color: Colors.red,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(25),
                                                          ),
                                                        ),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '1',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  25),
                                                            ),
                                                          ),
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        // margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                height: 56,
                width: 80,
                alignment: Alignment.center,
                //  color: Colors.green,
                child: Text(
                  '4 Items',
                  style: TextStyle(color: Colors.grey[900]),
                )),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Image.asset(
                'assets/black_border.png',
                width: 3,
              ),
            ),
            Container(
                alignment: Alignment.center,
                height: 56,
                width: 80,
                // color: Colors.green,
                child: Text('483')),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              color: BrandColors.kred,
              child: Text("VIEW CART",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ))
          ],
        ),
      ),
    );
  }

  Widget nameValue() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black12, //<-- SEE HERE
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Product Name Shyam',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            );
          }),
    );
  }

  Widget Filter() {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Grocery Orders',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text('Filter'),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/filter_icon_red.png',
                      width: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
