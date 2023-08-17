import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart' hide Response;
import 'package:intl/intl.dart';

import '../../HomeScreen/HomeView/Navbar.dart';
import '../../common/brand_colors.dart';
import 'ViewPageProdcet.dart';

class RealtedList extends StatefulWidget {
  const RealtedList({Key? key}) : super(key: key);

  @override
  State<RealtedList> createState() => _RealtedListState();
}

class _RealtedListState extends State<RealtedList> {
  String? selectedStateId;
  var Listdata = Get.arguments;
  List<dynamic> productiamges = [];
  List<dynamic> Totalquantity = [];
  List<dynamic> relateddata = [];
  List<dynamic> specification = [];

  String descrpiotion = "";
  String data = "";
  var isEnable = true;
  var api;
  var apiData;
  var vandorapi;
  String parsedstring3 = "";

  @override
  void initState() {
    super.initState();
    listProduct();
    print("sdks${Listdata}");
    setState(() {});
  }

  chnageStyle() {
    setState(() {
      isEnable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.kred,
        iconTheme: IconThemeData(color: Colors.white),
        title: FittedBox(
          child: Text(
            'Aao Carry Home',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                    Container(
                      // color: Colors.red,
                      child: Row(
                        children: [
                          Container(
                            // margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  //   color: Colors.blue,
                                  // color: Colors.red,
                                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  child: Text(apiData["name"]),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  //   color: Colors.red,
                                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  //  color: Colors.red,
                                  child: Row(
                                    children: [
                                      Text("Sold By"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        vandorapi["shop"],
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              chnageStyle();
                              setState(() {});
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(
                                right: 20,
                              ),
                              child: isEnable == true
                                  ? Image.asset(
                                      "assets/wishlist.png",
                                      width: 40,
                                    )
                                  : Image.asset(
                                      "assets/wishlist_icon_active.png",
                                      width: 40,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Container(
                        height: 400,
                        child: ImageSlideshow(
                          indicatorColor: Colors.red,
                          onPageChanged: (value) {
                            debugPrint('Page changed: $value');
                          },
                          autoPlayInterval: 3000,
                          isLoop: true,
                          children: [
                            if (productiamges.length != null)
                              for (int i = 0; i < productiamges.length; i++)
                                Image.network(
                                  'https://www.adquadshop.com/public/${productiamges[i]["image_490X475"]}',
                                  fit: BoxFit.fitHeight,
                                ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text("You Save"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "₹30.00",
                                  style: TextStyle(
                                      color: BrandColors.kred, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Inclusive of all taxes",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[600]),
                          ),
                          Text(
                            "In Stock",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      //   height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: DropdownButton<String>(
                              hint:
                                  Text("${Totalquantity[0]["quantity_type"]}"),
                              value: selectedStateId,
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              elevation: 16,
                              style: const TextStyle(color: Colors.grey),
                              onChanged: (String? newVal) async {
                                setState(() {
                                  selectedStateId = newVal;
                                });
                              },
                              items: Totalquantity.map((item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item["quantity_type"],
                                    style: const TextStyle(fontSize: 14.0),
                                  ),
                                  value: item["quantity_type"].toString(),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Column(children: [
                                  /* for (int i = 0; i < Totalquantity.length; i++)*/
                                  Text(
                                    "₹${Totalquantity[0]["discounted_price"]}",
                                    style: TextStyle(color: BrandColors.kred),
                                  ),
                                ]),
                                Column(
                                  children: [
                                    /*for (int i = 0;
                                        i < Totalquantity.length;
                                        i++)*/
                                    Text(
                                      "₹${Totalquantity[0]["price"]}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 13,
                                          color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // if(Totalquantity[1]["quantity_type"]==selectedStateId)

                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 30,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'ADD',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.grey[600]),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              Bidi.stripHtmlIfNeeded(apiData["description"]),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      margin: EdgeInsets.all(20),
                      child: Column(children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 50,
                              width: 175,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Brand"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: 175,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("${apiData["brandname"]}",
                                    style: TextStyle(fontSize: 15)),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 40,
                              width: 175,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Food Type"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                              child: Container(
                                padding: EdgeInsets.only(top: 10, right: 10),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    if (apiData["food_type"] == 1)
                                      Text("Vegtarian",
                                          style: TextStyle(fontSize: 15)),
                                    if (apiData["food_type"] == 2)
                                      Text("Non_Vegtarian",
                                          style: TextStyle(fontSize: 15)),
                                    if (apiData["food_type"] == 0)
                                      Text("n/m",
                                          style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 40,
                              width: 175,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Manufacture"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("${apiData["manufacturername"]}",
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 40,
                              width: 175,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Country of Origin"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: 175,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("${apiData["country_of_origin"]}",
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                for (int i = 0; i < specification.length; i++)
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    height: 40,
                                    width: 175,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        )),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          '${specification[i]["heading"]}',
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                for (int i = 0; i < specification.length; i++)
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width: 175,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    )),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${specification[i]["description"]}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          ],
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.centerLeft,
                            child: Text("RELATED PRODUCTS",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Container(
                              height: 450,
                              child: relateddata != null
                                  ? ListView.builder(
                                      itemCount: relateddata.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(ViewWhole(), arguments: [
                                              {
                                                "vander_id": relateddata[index]
                                                    ["data"]["vander_id"],
                                                "productid": relateddata[index]
                                                    ["data"]["productid"],
                                                "child_category_id":
                                                    relateddata[index]["data"]
                                                        ["subcategoryid"],
                                              }
                                            ]);
                                            Get.to(RealtedList(), arguments: [
                                              {
                                                "vander_id": relateddata[index]
                                                    ["data"]["vander_id"],
                                                "productid": relateddata[index]
                                                    ["data"]["productid"],
                                                "child_category_id":
                                                    relateddata[index]["data"]
                                                        ["subcategoryid"],
                                              }
                                            ]);
                                          },
                                          child: Container(
                                            // height: 800,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                    color: BrandColors.kred,
                                                    width: 2,
                                                  )),
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Image.network(
                                                          "https://www.adquadshop.com/public/${relateddata[index]["productiamges"][0]["image_490X475"]}",
                                                          width: 200,
                                                          height: 200,
                                                        ),
                                                        Container(
                                                          width: 250,
                                                          height: 70,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            relateddata[index]
                                                                    ["data"]
                                                                ["productname"],
                                                            //"jijkoj",
                                                            style: TextStyle(
                                                                fontSize: 19),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 250,
                                                          // color: Colors.grey,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                '₹${relateddata[index]["discounted_price"]}',
                                                                style: TextStyle(
                                                                    color:
                                                                        BrandColors
                                                                            .kred,
                                                                    fontSize:
                                                                        19),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                '₹${relateddata[index]["price"]}',
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: Container(
                                                              //color: Colors.red,
                                                              height: 40,
                                                              width: 190,
                                                              //margin: EdgeInsets.only(left: 20, right: 20),
                                                              //  alignment: Alignment.center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Colors.blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    //  color:Colors.red,
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    width: 90,
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/whitecart.png",
                                                                      width: 30,
                                                                      height:
                                                                          30,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Container(
                                                                      width: 90,
                                                                      child:
                                                                          Text(
                                                                        "ADD",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.white),
                                                                      )),
                                                                ],
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          width: 190,

                                                          // color: Colors.red,
                                                          child: Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                  width: 90,
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  // color:Colors.green,
                                                                  child: Container(
                                                                      //  color: Colors.red,
                                                                      height: 40,
                                                                      width: 40,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .blue,
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              25),
                                                                        ),
                                                                      ),
                                                                      child: Icon(
                                                                        Icons
                                                                            .remove,
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                '1',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                  height: 40,
                                                                  width: 40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .blue,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          25),
                                                                    ),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                                  : Container(
                                      child: Text("${relateddata.length}"),
                                    )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Important Information",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.grey[600]),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              Bidi.stripHtmlIfNeeded(apiData["disclaimer"]),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
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

  Future<void> listProduct() async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .post("https://adquadshop.com/api/grocery-product-details", data: {
        "productid": Listdata[0]["productid"],
        "categoryid": Listdata[0]["child_category_id"],
        "vendorid": Listdata[0]["vander_id"]
      });

      /*   print("responese5${api}");
      print("responese7${apiData}");*/
      if (response.statusCode == 200) {
        setState(() {
          api = response.data["success"];
          vandorapi = response.data["success"]["vandor"];
          apiData = response.data["success"]["product"];
          relateddata = api["relateddata"];
          productiamges = api["productiamges"];
          Totalquantity = api["Totalquantity"];
          specification = api["specification"];
          //SharedPrefHelper.setpref("Mauya", ml);

          print("responese5${api}");
          print("responese9${productiamges}");

          // returnproducts = api["returnproducts"];
          //   productiamges=api["productiamges"];
          //    print("helo${returnproducts}");
        });
      }
    } catch (e) {}
  }
}
