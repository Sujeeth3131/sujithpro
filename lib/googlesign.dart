import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login.dart';
class SignIN extends StatefulWidget {
  const SignIN({super.key});
  @override
  State<SignIN> createState() => _SignINState();
}
class _SignINState extends State<SignIN> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );




                  _signInWithGoogle();




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

}


_signInWithGoogle()async{

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  try {

    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if(googleSignInAccount != null ){
      final GoogleSignInAuthentication googleSignInAuthentication = await
      googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      // await _firebaseAuth.signInWithCredential(credential);
      // Navigator.pushNamed(context, "/home");
    }

  }catch(e) {
  //  showToast(message: "some error occured $e");
  }


}


