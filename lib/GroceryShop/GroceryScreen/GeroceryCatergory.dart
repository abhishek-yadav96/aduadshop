import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import '../../GroceryShop/GroceryScreen/GroceryShopSceen.dart';
import '../../common/SharedPrefHelper.dart';
import 'package:dio/dio.dart';
import '../../common/brand_colors.dart';
import '../Controller/GroceryController.dart';
import 'Groceryshop.dart';



class workfoplocal extends StatefulWidget {
  const workfoplocal({Key? key}) : super(key: key);

  @override
  State<workfoplocal> createState() => _workfoplocalState();
}

class _workfoplocalState extends State<workfoplocal> {


  List<dynamic> grocery = [];
  String name ="";
  bool styleOBJ = true;

  Future<void> listCatgoryData() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          "https://adquadshop.com/api/menu-list");

      var apidata = response.data["success"]["data"];
      if (response.statusCode == 200) {
        setState(() {
          grocery   = apidata["grocery"];

        });
        //print("devoice${name}");
     //   print("Macking${grocery}");
      }
    } catch (e) {}
  }
  chnageStyle(){
    setState(() {
      styleOBJ = false ;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listCatgoryData();
    //  _listVocalAndLocal.listCatgoryData();
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
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
                        margin: EdgeInsets.only(
                          left: 2,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search any Shop/Product/Category'),
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
            child:   SingleChildScrollView(
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
                    Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      // color: Colors.red,

                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Select Category',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    Container(
                        child: grocery.length != null ? Column(
                          children: [
                            for (int i = 0; i<grocery.length; i++)
                              GestureDetector(
                                onTap: (){
                                  var name =grocery[i]["slug"];
                                  print("sk${name}");
                                  Get.to(Gercory(),arguments: [grocery[i]["slug"]]);
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 120,
                                        margin: EdgeInsets.all(10),
                                        child:  Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Center(
                                                      child: Text("${grocery[i]["category_name"]}",
                                                          style:  styleOBJ
                                                              ? TextStyle(color: Colors.black, fontSize: 15)
                                                              : TextStyle(color:BrandColors.kred, fontSize: 15)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    'assets/grocery.jpg',
                                                    width: 200,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 10,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ):Container(
                          child: Text("${grocery.length}"),
                        )
                    )
                  ],
                ),
              ),
            ),

          )
        ],
      ),
    );
  }

}
