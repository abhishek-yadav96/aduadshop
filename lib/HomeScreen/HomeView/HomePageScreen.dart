import 'package:flutter/material.dart';

import '../../common/brand_colors.dart';
import 'Homelistdate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        Expanded(child: homelistData())
      ],
    ));
  }
}
