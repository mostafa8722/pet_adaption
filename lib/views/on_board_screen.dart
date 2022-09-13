
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_adaption/controllers/onBoard_controller.dart';
import 'package:pet_adaption/models/on_board.dart';
import 'package:pet_adaption/utils/constant.dart';
import 'package:pet_adaption/views/home_screen.dart';

class OnBoardScreen extends StatelessWidget{

  var height = Get.height;
  var width = Get.width;
  var controller = Get.put(OnBoardController());
  @override
  Widget build(BuildContext context) {

    controller.fetchBoard();
    return Scaffold(
      backgroundColor: Colors.white,
      body:



          Obx((){
           return
             SingleChildScrollView(scrollDirection: Axis.vertical,

              child:  Column(
                children: [
                  Container(
                    height: height*0.9 ,

                    color: Colors.white,
                    child: PageView.builder(
                      onPageChanged: (value){
                       controller.changePage(value);
                      },
                      itemCount: controller.onBoardData.length,
                      itemBuilder: (context,index)=>OnBoardContent(onBoard: controller.onBoardData[index]),),


                  ),
                  GestureDetector(
                    onTap: (){


                      Get.to(HomeScreen());
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      child: Center(child: Text("Continue",style: TextStyle(color: Colors.white),),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blue,

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [...List.generate( controller.onBoardData.length, (index) => indicator(index))],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            );
          }),


    );
  }


  AnimatedContainer indicator (index){
    return AnimatedContainer(
        height: 5,
        width: controller.currentPage==index?20:6,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: controller.currentPage==index?green:orange
        ),
        duration: const Duration(microseconds: 500));

  }
}
class OnBoardContent extends StatelessWidget{
  final OnBoard onBoard;
  var width = Get.width;
  var height = Get.height;


  OnBoardContent({required this.onBoard});
  @override
  Widget build(BuildContext context) {



    return

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){

              return Container(
                height: height>600?350:250,
                width: width-40,
                child:
                Stack(
                  alignment: Alignment.bottomCenter ,
                  children: [


                    Positioned(child:

                    ClipRRect(

                      borderRadius: BorderRadius.circular(30),




                        child:
                        Stack(
                          children: [
                        Container(
                        height: height>600?200:200,
                          width: width*0.8 ,
                          color: Colors.orange.shade200,),

                            Positioned(
                              top: 10,
                              left: -45,
                              height: 150,
                              width: 150,
                              child: Transform.rotate(
                                angle: -11.5,
                                child: SvgPicture.asset(
                                  'assets/images/Paw_Print.svg',
                                  height: 150,
                                  width: 150,
                                  color: orange,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: -30,
                              width: 100,
                              height: 100,
                              child: Transform.rotate(
                                angle: -32,
                                child: SvgPicture.asset(
                                  'assets/images/Paw_Print.svg',
                                  color: orange,
                                ),
                              ),
                            ),
                          ],
                        ),


                    ),
                      bottom: 0,
                    ),




                    Positioned.fill(

                        child:Align(child:  Image.asset(onBoard.image,height: height>600?350:250,),
                        alignment: Alignment.center,
                        )

                    )



                  ],
                )


              );
            }),

            SizedBox(height: 30,),
            Text.rich(
              TextSpan(
                  style:poppins.copyWith(
                      height:1.2,
                      color: black,
                      fontWeight:FontWeight.bold,
                      fontSize: 32),
                  children: [
                    TextSpan(text: "Find Your",style: poppins),
                    TextSpan(text: "Dream\n",style: poppins.copyWith(color:blue)),
                    TextSpan(text: "Pet Here",style: poppins),
                  ]
              ),
            ),
            SizedBox(height: 10,),
            Text(onBoard.text,style: TextStyle(fontSize: 20),)
          ],
        ),
      );
  }
}
