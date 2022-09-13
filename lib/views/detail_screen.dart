
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_adaption/models/cat.dart';
import 'package:pet_adaption/utils/constant.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatelessWidget{
  Cat cat;
  DetailScreen({required this.cat});
  @override
  Widget build(BuildContext context) {

    var height = Get.height;
    var width = Get.width;
    return Scaffold(

      body:
      Container(
        height: height,
         color: cat.color.withOpacity(0.6),
        child: Column(
          children: [
            Container(
              height: height*0.45,

              child:Stack(
                children: [

                  Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child:  Row(

                      children: [
                        GestureDetector(onTap: (){
                          Get.back();
                        },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,

                            ),
                            child:Center(child: Icon(Icons.arrow_back_ios),) ,
                          ),
                        ),
                        GestureDetector(onTap: (){

                        },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,

                            ),
                            child:Center(child: Icon(Icons.more_horiz),) ,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  Positioned(
                      top: 50,
                      left: -20,
                      child:
                      Transform.rotate(
                          child: SvgPicture.asset(
                            'assets/images/Paw_Print.svg',
                            height: 150,
                            width: 150,
                            color: cat.color,
                          ),
                          angle:-16 )

                  ),
                  Positioned(
                      bottom: 10,
                      right: -20,
                      child:
                      Transform.rotate(
                          child: SvgPicture.asset(
                            'assets/images/Paw_Print.svg',
                            height: 150,
                            width: 150,
                            color: cat.color,
                          ),
                          angle:-36 )

                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      height: 240,
                      child:Image.asset(cat.image) ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: height*0.55,

              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(cat.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Row(

                              children: [
                                SizedBox(width: 10,),
                                Icon(Icons.location_on,color: Colors.black.withOpacity(0.5),size: 16,),
                                SizedBox(width: 5,),
                                Text(cat.location,style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(0.5)),)
                              ],
                            )
                          ],


                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ]

                          ),
                          child: Icon(Icons.favorite_border,color: Colors.black.withOpacity(0.5),size: 19,),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        detailItem(Colors.green,cat.sex,"Sex"),
                        detailItem(Colors.orange,"${cat.age} Years","Age"),
                        detailItem(Colors.blue,"${cat.weight} Kg ","Weight"),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(cat.owner.image),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            SizedBox(width: 4,),
                            Column(
                              children: [
                                Text(cat.owner.name,style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,color: Colors.black.withOpacity(0.7)),),
                                SizedBox(height: 4,),
                                Text(cat.name + " Owner",style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.6)),),
                              ],
                            )
                          ],
                        ),

                        Row(
                          children: [
                           GestureDetector(
                             onTap: (){},
                             child:  Container(
                               height:40,
                               width:40,
                               decoration: BoxDecoration(
                                   color: Colors.blue.withOpacity(0.6),
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Center(child: Icon(Icons.chat_outlined,color: Colors.blue,),),
                             ),
                           ),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: (){},
                              child:  Container(
                                height:40,
                                width:40,
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(child: Icon(Icons.phone,color: Colors.red,),),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    ReadMoreText(
                      cat.description,
                      textAlign: TextAlign.justify,
                      trimCollapsedText: 'See More',
                      colorClickableText: orange,
                      trimLength: 100,
                      trimMode: TrimMode.Length,
                      style:
                      poppins.copyWith(color: black.withOpacity(0.6)),
                    ) ,
                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: width,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3),
                                color: blue,
                                spreadRadius: 0,
                                blurRadius: 10)
                          ]
                        ),
                        child: Center(
                          child: Text("Adapt Me ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    )

                  ],
                ),
              ),


            )
          ],
        ),
      )
    );
  }
  Widget detailItem(Color color,String title,String label){

    var width = Get.width;
    return  Container(
      height: 120,
      width: width/3 -30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withOpacity(0.6),
      ),
      child: Stack(
        children: [
         Center(child:  Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.75),fontSize: 18),),
             SizedBox(height:5 ,),
             Text(label,style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 15),),
           ],
         ),),
          Positioned(
              bottom: 0,
              right: -10,
              child: Transform.rotate(
                  angle: -32,
                child: SvgPicture.asset(
                  'assets/images/Paw_Print.svg',
                  height: 100,
                  width: 100,
                  color: color,
                ),
              )),
        ],
      ),
    );
  }
}