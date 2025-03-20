import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeBottomPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("asset/image/monety.png",height: 28,),
                        Text(" Monety",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                      ],
                    ),
                    Icon(Icons.search_rounded,size: 25,)
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius:BorderRadius.circular(25),child: Image(image: AssetImage("asset/image/avatar.png"),height: 45,width: 45,fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(" Morning",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey),),
                            Text(" Aditya Singh",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0x1b194cff)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(" This Month",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black),),
                          Icon(Icons.expand_more_rounded,size: 20,)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 150,
                  padding: const EdgeInsets.only(left: 20,top: 5,bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff6674D3)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expense total",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),),
                          Text("\$3,734",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                          Row(
                            children: [
                              Container(
          
                                padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red
                                ),
                                child: Center(child: Text("+\$240",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 12,color: Colors.white),)),
                              ),
                              Text(" than last month",style: TextStyle(fontFamily:"Poppins",fontSize: 12,color: Colors.white),),
                            ],
                          ),
                        ],
                      ),
                      Image.asset("asset/image/monety_bg2.png",height:93)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text(" Expense List",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 220,
                  padding: const EdgeInsets.only(left: 12,right: 12,top: 5,bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tuesday, 14",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                          Text("-\$1380",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                        ],
                      ),
                      Divider(color: Colors.grey,thickness: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0x5c6674d3)
                                ),
                                child: Icon(Icons.shopping_cart_outlined,size: 20,color: Color(0xff6674D3)),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Shop",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                                  Text("Buy new clothes",style: TextStyle(fontFamily:"Poppins",fontSize: 12,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                          Text("-\$90",style: TextStyle(fontWeight: FontWeight.bold,fontFamily:"Poppins",fontSize: 14,color: Color(0xffE78BBC)),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0x3de2caaa)
                                ),
                                child: Icon(Icons.phone_android_rounded,size: 20,color: Color(0xffE2CAAA)),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Electronic",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                                  Text("Buy new iphone 14",style: TextStyle(fontFamily:"Poppins",fontSize: 12,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                          Text("-\$1290",style: TextStyle(fontWeight: FontWeight.bold,fontFamily:"Poppins",fontSize: 14,color: Color(0xffE78BBC)),),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 150,
                  padding: const EdgeInsets.only(left: 12,right: 12,top: 5,bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tuesday, 14",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                          Text("-\$60",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                        ],
                      ),
                      Divider(color: Colors.grey,thickness: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0x56c76364)
                                ),
                                child: Icon(Icons.emoji_transportation,size: 20,color: Color(0xffC76364)),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Transportation",style: TextStyle(fontFamily:"Poppins",fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                                  Text("Trip to Malang",style: TextStyle(fontFamily:"Poppins",fontSize: 12,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                          Text("-\$60",style: TextStyle(fontWeight: FontWeight.bold,fontFamily:"Poppins",fontSize: 14,color: Color(0xffE78BBC)),),
                        ],
                      ),
          
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}