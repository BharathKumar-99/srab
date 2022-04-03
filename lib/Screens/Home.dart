

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srab/Utils/CustomColors.dart';
import 'package:srab/Widgets/Widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

 
}

class _HomeState extends State<Home> {
   List<String> chip = [
      "Funny",
      "Action",
      "Anime",
      "Horror",
      "Fantacy",
      "Adventure"
    ];
  
   var username={};
  bool isLoading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
getdata();

  }

void getdata() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    try{
final firestoreInstance = FirebaseFirestore.instance;
    var snap=await firestoreInstance.collection("users").doc(firebaseUser!.uid).get();
    
    
 username=snap.data()!;
 setState(() {
   isLoading=false;
 });
    }catch(e){
      print(e);
    }
      
    
  }

 
  @override
  Widget build(BuildContext context) {
 
  
    return isLoading?Center(child: CircularProgressIndicator(),): Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomText(
          text: "SRAB",
          size: 23,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 35,
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            iconSize: 35,
           color: Colors.black,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
             
              "Hello " +username['username'] +" !",
              
              style: GoogleFonts.lobster(
                  fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Text(
              "Whats on your mind?",
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Genre",
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: chip.length,
                itemBuilder: (ctx, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Chip(label: Text(chip[index])),
                  );
                },
              ),
            ),
            Text("Trending",
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            // Expanded(
            //   child: ListView.builder(
            //     itemBuilder: (context, index) {
            //       return
            //     },
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(10.0),
                child: StreamBuilder(
                  stream:FirebaseFirestore.instance.collection('posts').snapshots(), 
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) { 
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(color: CustomColor.cosmic_red),
                      );
                      
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) => Post_card(
                          snap: snapshot.data!.docs[index].data(),
                        ),
            
                      );
                   },
              ),
              ),
            )
          ],
        ),
      ),

     
    );
  }
}

