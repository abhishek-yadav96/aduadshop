import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';


import '../../common/brand_colors.dart';
import '../HomeController/Home_controller.dart';

final _listController = Get.find<HomeController>();

class homelistData extends StatefulWidget {
  const homelistData({Key? key}) : super(key: key);

  @override
  State<homelistData> createState() => _homelistDataState();
}

class _homelistDataState extends State<homelistData> {

  var name="";
  List<dynamic> list =[];
  List<dynamic> left =[];
  var ask;
  List<dynamic> CardPopulardata =[];

  @override
  void initState() {
    super.initState();
    data();
    //_listController.data();
    setState(() {});
  }
  Future<void> data() async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
          "https://www.adquadshop.com/api/home-api-all/api-data",options: Options(headers: {'Content-type': 'application/json'},),
          data: {
            "user_id":"",
            "vandorid":"",
            "limit"   :20,
            "latitude":30.900965,
            "longitude":75.8572758
          });
      var apidata = response.data;
   //   print("responese${apidata}");
      if (response.statusCode == 200) {
        setState(() {
         left=apidata["banner"];
         list = apidata["midderbanner"];
         ask = apidata["dealpopularsearch"];
         CardPopulardata =ask["productarray"];
       });


      }
    } catch (e) {}
  }





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        // color: Colors.red,
        child: list.length== null ? LinearProgressIndicator():Column(
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
              // color: Colors.greenAccent,
              child: Column(
                children: [
                  Container(
                    child: ImageSlideshow(
                      indicatorColor: Colors.red,
                      onPageChanged: (value) {
                        debugPrint('Page changed: $value');
                      },
                      autoPlayInterval: 30000,
                      isLoop: true,
                      children: [
                        Image.network(
                            "https://adquadshop.com/public/midderbanner/image1/${list[0]["image1"]}", fit: BoxFit.cover,),
                        Image.network(
                            "https://adquadshop.com/public/midderbanner/image2/${list[0]["image2"]}", fit: BoxFit.cover,),
                        Image.network(
                            "https://adquadshop.com/public/midderbanner/image3/${list[0]["image3"]}", fit: BoxFit.cover,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 155,
              child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      //color: Colors.indigo,
                      child: Row(
                        children: [
                          Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          child: Image.network(
                                            "https://www.adquadshop.com/public/banner/bannerleft1/${left[0]["top_left_image1"]}",
                                            width: 200,
                                          )),
                                      Container(
                                        height: 30,
                                        child: Text(
                                          '${left[0]["top_left_heading1"]}',
                                          style: TextStyle(
                                              color: BrandColors.kred,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          child: Image.network(
                                            "https://www.adquadshop.com/public/banner/bannerleft2/${left[0]["top_left_image2"]}",
                                            width: 200,
                                          )),
                                      Container(
                                        height: 30,
                                        child: Text(
                                          '${left[0]["top_left_heading2"]}',
                                          style: TextStyle(
                                              color: BrandColors.kred,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          child: Image.network(
                                            "https://adquadshop.com/public/banner/bannerright1/${left[0]["top_right_image1"]}",
                                            width: 200,
                                          )),
                                      Container(
                                        height: 30,
                                        child: Text(
                                          '${left[0]["top_right_heading1"]}',
                                          style: TextStyle(
                                              color: BrandColors.kred,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          child: Image.network(
                                            "https://www.adquadshop.com/public/banner/bannerright2/${
                                                left[0]["top_right_image1"]}",
                                            width: 200,
                                          )),
                                      Container(
                                        height: 30,
                                        child: Text(
                                          '${left[0]["top_right_heading2"]}',
                                          style: TextStyle(
                                              color: BrandColors.kred,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              //color: Colors.black,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'POPULAR SEARCHES',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 360,
                    //  color: Colors.red,
                    child: ListView.builder(
                        itemCount:CardPopulardata.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    //padding: EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Image.network(
                                            'https://www.adquadshop.com/public/${
                                                CardPopulardata[index]["productiamge"]}',
                                            width: 300,
                                            height: 300,
                                            fit: BoxFit.cover,
                                          ),
                                          Container(
                                            color: Colors.grey[300],
                                            width: 300,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.fromLTRB(
                                                10, 4, 0, 5),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: FittedBox(
                                                    child: Text(
                                                      CardPopulardata[index]["shop"],
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors
                                                              .black),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Upto 33% Discount Coupans",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

}
