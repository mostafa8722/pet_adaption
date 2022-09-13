
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_adaption/controllers/home_controller.dart';
import 'package:pet_adaption/models/cat.dart';
import 'package:pet_adaption/models/category.dart';
import 'package:pet_adaption/utils/constant.dart';
import 'package:pet_adaption/views/detail_screen.dart';

class HomeScreen extends StatelessWidget{

  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {

    controller.fetchCategories();
    controller.fetchIcons();
    controller.fetchCats();
    return Scaffold(
      backgroundColor:white,
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx((){
            return Column(
              children: [
                headerContainer(),
                SizedBox(height: 10,),
                banerContainer(),
                SizedBox(height: 20,),
                categoriesContainer(),
                SizedBox(height: 20,),
                adaptContainer()
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar:Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: controller.icons.map((element) => customBottom(element)).toList(),
        ),
      ) ,
    );
  }

  Widget headerContainer (){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Column(children: [
          Row(children: [
            Text("Location",style: poppins.copyWith(color: Colors.black.withOpacity(0.56),fontSize: 16),),
            SizedBox(width: 5,),
            Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black.withOpacity(0.56),)
          ],),
          SizedBox(height: 3,),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Pekanbaru,",style: poppins.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color:Colors.black,
            )),
            TextSpan(text: "Riau",style: poppins.copyWith(
              fontSize: 24,

              color:Colors.black,
            ))
          ]))
        ],),
        Row(
          children: [
            Icon(Icons.search,size:18,color: Colors.black.withOpacity(0.8),),
            Stack(children: [
              Icon(Icons.notifications_none,size:18,color: Colors.black.withOpacity(0.8),),
              Positioned(
                  right: 4,
                  top: 3,
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                  )

              ),
            ],)
          ],
        )
      ],
    );
  }
  Widget banerContainer(){
    var width = Get.width;
    return ClipRRect(
      child: Container(
        height: 250,
        width: width,
        color: blue.withOpacity(0.6),
        child: Stack(
          children: [
            Padding(padding:
            EdgeInsets.only(left:40,top: 30),
              child:    Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text("Join Our Animal ",style: TextStyle(fontSize: 20,color: white),),
                  SizedBox(height: 3,),
                  Text("Lovers Community ",style: TextStyle(fontSize: 20,color: white),),
                  SizedBox(height: 5,),
                  GestureDetector(onTap: (){},
                    child:Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: orange.shade200,
                        borderRadius: BorderRadius.circular(15),

                      ),
                      child:  Center(child: Text("Join Us",style: TextStyle(color: white,fontSize: 18),),),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                right: 20,
                child: Image.asset('assets/images/cats/cat1.png',height: 135,))
          ],

        ),
      ),
      borderRadius: BorderRadius.circular(20),

    );
  }

  Widget categoriesContainer(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("categories",style: TextStyle(color: Colors.black.withOpacity(0.75),fontSize: 20,fontWeight: FontWeight.bold),),
            Row(
              children: [
                Text("View All",style: TextStyle(color: Colors.orange.withOpacity(0.75),fontSize: 16),),
               SizedBox(width: 5,),
               GestureDetector(onTap: (){},
               child:  ClipRRect(
                 borderRadius: BorderRadius.circular(5),
                 child: Container(
                   color: Colors.orange.withOpacity(0.75),
                   height: 25,
                   width: 25,
                   child: Center(child: Icon(Icons.keyboard_arrow_right_rounded,color:Colors.white ,),),
                 ),
               ),
               ),
                SizedBox(width: 5,),
              ],
            )
          ],
        ),
        SizedBox(height: 10,),


          /*child: ListView(
            scrollDirection: Axis.horizontal,
            children:controller.categories.map((category) => customCat(category)).toList() ,
          ),*/
           SingleChildScrollView(

            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:controller.categories.map((category) => customCategory(category)).toList()  ,
            ),
          ),

      ],
    );
  }
  Widget customCategory(Category category){

     return  GestureDetector(
      onTap: (){
        controller.changePage(category.id);
      },
      child:ClipRRect(

        child: Container(
          margin: EdgeInsets.only(left: 10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: controller.selectedPage ==category.id?blue.withOpacity(0.76):white,
            borderRadius: BorderRadius.circular(10),
            boxShadow:  [
              controller.selectedPage == category.id
                  ? const BoxShadow(
                  offset: Offset(0, 5),
                  color: blue,
                  spreadRadius: 0,
                  blurRadius: 5)
                  : const BoxShadow(color: white),
            ],
          ),
          child: Center(child: category.id==0?Icon(Icons.list_rounded,color: controller.selectedPage ==category.id?white:Colors.black.withOpacity(0.7),):
          Text(category.name,style: TextStyle(color: controller.selectedPage ==category.id?white:Colors.black.withOpacity(0.7)),) ,)
         ,
        ),
      ),
    );

  }

  Widget adaptContainer(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Adapt pet",style: TextStyle(color: Colors.black.withOpacity(0.75),fontSize: 20,fontWeight: FontWeight.bold),),
            Row(
              children: [
                Text("View All ${controller.cats.length}",style: TextStyle(color: Colors.orange.withOpacity(0.75),fontSize: 16),),
                SizedBox(width: 5,),
                GestureDetector(onTap: (){},
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.orange.withOpacity(0.75),
                      height: 25,
                      width: 25,
                      child: Center(child: Icon(Icons.keyboard_arrow_right_rounded,color:Colors.white ,),),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
              ],
            )
          ],
        ),
        SizedBox(height: 10,),
        Container(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:controller.cats.map((cat) => customCat(cat)).toList() ,
          ),
        ),
      ],
    );
  }
  Widget customCat(Cat cat){

        return  GestureDetector(
          onTap: (){
            //controller.changePage(category.id);
            Get.to(DetailScreen(cat: cat,));
          },
          child: Card(
           margin: EdgeInsets.only(left: 20),
           elevation: 4,
           shadowColor: Colors.black.withOpacity(0.9),
           color: cat.color.withOpacity(0.6),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(20)
           ),
           child:Container(

             height: 300,
             width: 300,
             child: Stack(
               children: [
                 Column(children: [
                   SizedBox(width: 20,),
                   Padding(
                     padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                     child:   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [

                         Text(cat.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                         Container(
                           height: 40,
                           width: 40,
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.white
                           ),
                           child: Icon(Icons.favorite,color: Colors.red,size: 16,),
                         )

                       ],
                     ),
                   ),
                   SizedBox(height: 5,),
                Row(

                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.location_on,color: Colors.white,size: 16,),
                    SizedBox(width: 5,),
                    Text(cat.location,style: TextStyle(fontSize: 16,color: Colors.white),)
                  ],
                )

                 ],),
                 Positioned(
                      bottom: 10,
                     right: 10,
                     height: 150,
                     child:Image.asset(cat.image) ),
                 Positioned(
                   top: 50,
                   left: -45,
                   height: 150,
                   width: 150,
                   child: Transform.rotate(
                     angle: -11.5,
                     child: SvgPicture.asset(
                       'assets/images/Paw_Print.svg',
                       height: 150,
                       width: 150,
                       color: cat.color,
                     ),
                   ),
                 ),

                 Positioned(
                   bottom: 10,
                   right: -45,
                   height: 150,
                   width: 150,
                   child: Transform.rotate(
                     angle: -21.5,
                     child: SvgPicture.asset(
                       'assets/images/Paw_Print.svg',
                       height: 150,
                       width: 150,
                       color: cat.color,
                     ),
                   ),
                 ),
               ],
             ),
           ) ,
         )
        );

  }
  Widget customBottom(IconData icon){
    return Container(
      height: 60,
      width: 50,
      child: Stack(
        children: [
          Column(
          children: [
            Icon(icon,color: icon==Icons.home_outlined?blue:Colors.black.withOpacity(0.5),),
            SizedBox(height: 4,),
            icon==Icons.home_outlined?Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: blue,
                shape: BoxShape.circle
              ),
            ):Container()
          ],
          ),
          icon==Icons.chat_outlined?
              Positioned(
                  right: 10,
                  top: 0,
                  child:
             Container(

               height: 15,
               width: 15,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: blue,
               ),
               child: Center(child: Text("8",style: TextStyle(color: white),),),
             )
              ):Container()
        ],
      ),
    );
  }
}