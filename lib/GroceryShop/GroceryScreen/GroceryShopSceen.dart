import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart' hide Response;

import '../../common/SharedPrefHelper.dart';
import '../../common/brand_colors.dart';
import '../Controller/GroceryController.dart';
import 'ListDataShowing.dart';
import 'ViewPageProdcet.dart';

final featuredArticleService = Get.find<GerceryController>();

class GroceryOrder extends StatefulWidget {
  const GroceryOrder({Key? key}) : super(key: key);

  @override
  State<GroceryOrder> createState() => _GroceryOrderState();
}

class _GroceryOrderState extends State<GroceryOrder> {
  double sum = 0;
  var data = Get.arguments;
  List<dynamic> getData = [];
  List<dynamic> banner = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datalist(data);
    print("helkop${data}");
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          height: 80,
          color: BrandColors.kPinkyWhite,
          padding: EdgeInsets.only(top: 15, bottom: 10),
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
                      //color: Colors.red,
                      margin: EdgeInsets.only(
                        left: 2,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search any Shop / Product / Category'),
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
                      height: 60,
                      // color: Colors.red,
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                          Text(
                            'Sector 62, Noida , Uttar Pradesh.',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      )),
                  Container(
                    child: ImageSlideshow(
                      indicatorColor: Colors.red,
                      onPageChanged: (value) {
                        debugPrint('Page changed: $value');
                      },
                      autoPlayInterval: 30000,
                      isLoop: true,
                      children: [
                        for (int i = 0; i < banner.length; i++)
                          Image.network(
                            'https://adquadshop.com/public/thumbnail/${banner[i]["image_one"]}',
                            fit: BoxFit.cover,
                          ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Grocery Orders',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
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
                                    'assets/filter_icon.png',
                                    width: 20,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                    child: Column(
                      children: [
                        for (int i = 0; i < getData.length; i++)
                          Container(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(ListData(),arguments: [{"vendor_id":getData[i]["vendor_id"],"subcategory_id":getData[i]["subcategoryid"]}]);
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    //  color: Colors.red,
                                    height: 250,
                                    margin: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(19),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      'https://www.adquadshop.com//public/${getData[i]["shop_display"]}'))),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              alignment: Alignment.bottomCenter,
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(19),
                                                    bottomLeft:
                                                        Radius.circular(19),
                                                  )),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.09,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.90,
                                              child: Text(
                                                'Upto ${getData[i]["percentage"]} % off',
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    color: BrandColors.kred,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Container(
                                          //color: Colors.grey,
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 40, 0, 0),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  getData[i]["shop"],
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Container(
                                                //   color:Colors.red,
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 5, 0, 0),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  getData[i]["address"],
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.grey[600]),
                                                ),
                                              ),
                                              /* Container(
                                                    padding: EdgeInsets
                                                        .fromLTRB(
                                                        10, 10, 0, 0),
                                                    alignment: Alignment
                                                        .centerLeft,
                                                    child: Text(
                                                      getData[i]["area"],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .grey[600]),
                                                    ),
                                                  ),*/
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                              child: SizedBox(
                                                            child: Image.asset(
                                                              'assets/star_icon.png',
                                                              width: 15,
                                                            ),
                                                          )),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            child: Text(getData[i]["percentage"].toStringAsFixed(
                                                                1),),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 0, 10, 0),
                                                      child: Image.asset(
                                                        'assets/black_border.png',
                                                        width: 3,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Icon(
                                                              Icons.location_on,
                                                              size: 17,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              getData[i][
                                                                      "distance"]
                                                                  .toStringAsFixed(
                                                                      1),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
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
                                Divider(
                                  height: 10,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
  Future<void> datalist(data) async {
    try {
      Dio dio = Dio();
      Response response =
      await dio.post("https://adquadshop.com/api/api-gorcery-shop", data: {
        "category": data,
        "orderby": "",
        "nearMelocation": "",
        "shopdistance": "",
        "allergensearch": "",
        "popularMy": "",
        "recordslimit": 40,
        "page": 1,
        "latitude": 30.900965,
        "longitude": 75.8572758,
        "categoryslug": "grocery"
      });
      var api = response.data["success"];
      var apidata = response.data["success"]["data"];
      print("responese${api}");
      if (response.statusCode == 200) {
        setState(() {
          getData = apidata["productarray"];
          banner = api["banner"];
          print("shial${banner}");
        });
      }
    } catch (e) {}
  }

}
