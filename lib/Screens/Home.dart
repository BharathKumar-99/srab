import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srab/Utils/CustomColors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         toolbarHeight: 100,
          automaticallyImplyLeading: false,
         backgroundColor: Colors.white,
         elevation: 0,
          title:  Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: TextFormField(
                decoration: const InputDecoration(
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                  color: CustomColor.cosmic_red, width: 4.0),
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderSide:  BorderSide(
                                  color: CustomColor.cosmic_red, width: 4.0),
                            ),
                    hintText: 'Search',
                      ),
                      
              ),
          ),
            actions:  <Widget>[
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () async => await FirebaseAuth.instance.signOut(),
                  child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image:  DecorationImage(
                          fit: BoxFit.fill,
                          image:  NetworkImage(
                     "https://i.imgur.com/BoN9kdC.png")
                     ),
                ),
                ),
                ),
              )
   
  ],
          ),
 
    );
  }
}
