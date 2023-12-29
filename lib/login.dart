import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // User? _user;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _auth.authStateChanges().listen((event) {
  //     setState(() {
  //       _user = event;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Text != null ? _userInfo() : _googleSignInButton(),
    );
  }
  Widget _googleSignInButton() {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Card(
          elevation: 10,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.65,
                width:  MediaQuery.of(context).size.width*1,
                decoration: BoxDecoration(
                    image:  DecorationImage(
                      image: NetworkImage("https://expertphotography.b-cdn.net/wp-content/uploads/2020/07/smartphone-food-photography-1.jpg"),
                      fit: BoxFit.fill, ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.10,
                width:  MediaQuery.of(context).size.width*1,
                child: const Column(
                  children: [
                    Text("Dive in without delay",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )),
                    Text("Lorem ipsum dolor sit amount consectetor ",style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                    )),
                    Text("Nequr et nulla et ",style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                    )),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(onPressed: (){
                  setState(() {
                    _handleGoogleSignIn;
                  });

                },
                    child: const SizedBox(
                      height:60,width: 140,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              height:30,width: 30,
                              child: Image(
                                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCVXBYyxQNfjdXQYCt1dY-hoT8QX5ayNjdVA&usqp=CAU'),
                                fit: BoxFit.fill,)),
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.0),
                            child: Text("Sign In", style : TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                            ),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInfo() {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: SafeArea(
          bottom: true,
          left: true,
          top: true,
          right: true,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child:
                  Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 30,
                              color: Colors.orange,),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child:
                              Row(
                                children: [
                                  Text('office',
                                      style: GoogleFonts.openSans(fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Icon(Icons.keyboard_arrow_down_outlined),
                                ],
                              ),



                            ),


                          ],
                        ),
                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text("38/A, 3rd Floor, 18th Main,22nd..",style: TextStyle(color: Colors.grey,fontSize: 18),),
                      )
                    ],
                  ),
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * .26,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: Offer_details.length,
                  itemBuilder: (BuildContext context, int index,
                      int realIndex) {
                    return
                      Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: gtgreen,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 5)
                              )
                            ],
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: AssetImage(Offer_details[index].image),
                                fit: BoxFit.fill
                            )
                        ),

                      );

                  },


                ),
                Card(
                  elevation: 20,
                  shadowColor: Colors.black,
                  child: Container(
                    height: 45,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .9,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: Icon(Icons.menu),

                              hintText: "Restaurant name or dish"

                          ),

                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: budgetdetails.length,
                      itemBuilder: (BuildContext, index) {
                        return
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0, left: 15),
                            child: Center(
                              child: SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * .28,

                                child: Column(
                                  children: [
                                    SizedBox(height: 4,),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.black12
                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: gtgreen,
                                                    spreadRadius: 1,
                                                    blurRadius: 3,
                                                    offset: Offset(0, 5)
                                                )
                                              ],
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(image: AssetImage(
                                                  budgetdetails[index].image),
                                                  fit: BoxFit.fill)
                                          ),


                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        budgetdetails[index].text, style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:18,
                                          color: Colors.black),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );

                      },
                    ),
                  ),

                ),
                Padding(
                  padding:  EdgeInsets.only(left: 30.0),
                  child: Text('Restaurant near you',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,)
                  ),
                ),


                Container(
                  height: 900,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext con,index)
                      {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Stack(
                                  children:[
                                    Card(
                                      elevation: 20,
                                      color: Colors.black,
                                      borderOnForeground: false,
                                      child: Container(
                                        height: 170,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(image: AssetImage("assets/pic/pizza.jpg"),fit: BoxFit.fill)),
                                      ),
                                    ),
                                    Positioned(right: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.favorite_border,),
                                      ),
                                    )
                                  ]
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Domino's pizza",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                                  Text("4.2(10K+) 25 mins",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text("Pizzzas,Italian,Pastas",),
                                  Text("Pimple Saudagar"),
                                  Text("Free Delivery",style: TextStyle(color: Colors.green),),
                                ],
                              )
                            ],
                          ),
                        );

                      }
                  ),
                ),

              ]

          ),
        ),
      ),



    );
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      //_auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }
}
