

import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/LifeStyleController.dart';


class LifeStyle extends StatefulWidget {
  const LifeStyle({Key? key}) : super(key: key);

  @override
  State<LifeStyle> createState() => _LifeStyleState();
}

class _LifeStyleState extends State<LifeStyle> {
  @override
  Widget build(BuildContext context) {
    return Container();/* Container(
         child: CarouselSlider(

           options: CarouselOptions(height: 200.0,
             autoPlay: true,
             autoPlayInterval: Duration(seconds: 3),
             autoPlayAnimationDuration: Duration(milliseconds: 800),
             autoPlayCurve: Curves.fastOutSlowIn,
             enlargeCenterPage: true,
             //enlargeFactor: 0.3,

             scrollDirection: Axis.horizontal,),

           items: [1,2,3,4,5].map((i) {
             return Builder(
               builder: (BuildContext context) {
                 return Container(
                     width: MediaQuery.of(context).size.width,
                     margin: EdgeInsets.symmetric(horizontal: 5.0),
                     decoration: BoxDecoration(
                         color: Colors.amber
                     ),
                     child: Container(
                       child: Column(
                         children: [
                           Image.network(item, fit: BoxFit.cover, width: 1000.0),
                           Positioned(
                             bottom: 0.0,
                             left: 0.0,
                             right: 0.0,
                             child: Container(
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                   colors: [
                                     Color.fromARGB(200, 0, 0, 0),
                                     Color.fromARGB(0, 0, 0, 0)
                                   ],
                                   begin: Alignment.bottomCenter,
                                   end: Alignment.topCenter,
                                 ),
                               ),
                               padding: EdgeInsets.symmetric(
                                   vertical: 10.0, horizontal: 20.0),
                             ),
                           ),
                         ],
                       ),
                     )
                 );
               },
             );
           }).toList(),
         ),
    );*/
  }
}
