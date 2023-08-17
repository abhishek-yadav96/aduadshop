import 'package:flutter/material.dart';

import '../../common/brand_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Positioned(
          top: 0,
            left: 0,
            right: 0,
           // bottom: 0,
            child: Container(
               height: 400,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 90),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.close),
                  ),
                  Container(
                    child: Image.asset(
                      "assets/login_icon.png",
                      width: 250,
                      height: 200,
                    ),
                  ),
                  Container(
                    child: Image.asset("assets/50bonus_txt.png",width: 300,),
                  )
                ],
              ),
            )),
        Positioned(
            top: 450,
            left: 30,
            child: Container(
              height: 20,
              width: 130,
              color: Colors.white,
              child: Positioned(
                  top: 900,
                  child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: BrandColors.kBlack,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Enter Name',
                            hintText: 'Enter Your Name'),
                      ))) ,
            ),

        ),

      ],
    );
  }
}
