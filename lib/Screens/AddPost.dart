import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:srab/Services/Firestore_method.dart';

import '../Widgets/Widgets.dart';
import 'Home.dart';

class AddPost extends StatefulWidget {
  AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File? _file;
  ImagePicker picker = ImagePicker();
  final TextEditingController _storyName = TextEditingController();
  final TextEditingController _shortdescription = TextEditingController();
  final TextEditingController _fulldescription = TextEditingController();

  _selectimage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create a post"),
            children: [
              SimpleDialogOption(
                  child: const Text(
                    "Choose from gallery",
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    final image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image == null) return;

                    final imagetemp = File(image.path);
                    setState(() {
                      _file = imagetemp;
                    });
                  })
            ],
          );
        });
  }

  @override
  void dispose() {
    
    super.dispose();

    _shortdescription.dispose();
    _fulldescription.dispose();
    _storyName.dispose();
  }


 addposttofirebase(String username,
String picurl,
String uid,) async{
try{
String res=await FireStoreMethods().uploadPost(
  storyname, picurl, username, detailsshort, uid, fullstory, genere)
}catch

  }






  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var twentyheight = height / 39.5;
    var height35 = height / 22.31;
    var heigth25 = height / 31.24;
    var height200 = height / 3.9;
    var height75 = height / 11.61;

    final User user=Provider.of(context).getUser();

    List<String> chip = [
      "Funny",
      "Action",
      "Anime",
      "Horror",
      "Fantacy",
      "Adventure"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add Story",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text("Add Cover for the Story ",
                style: GoogleFonts.lato(fontSize: 23)),
            SizedBox(
              height: heigth25,
            ),
            GestureDetector(
              onTap: () => _selectimage(context),
              child: SizedBox(
                  height: height200,
                  width: double.infinity,
                  child: SizedBox(
                    height: height200,
                    width: double.infinity,
                    child: _file == null
                        ? Image.asset("assets/placeholder.jpg")
                        : Image.file(
                            _file!,
                            fit: BoxFit.fill,
                          ),
                  )),
            ),
            SizedBox(
              height: heigth25,
            ),
            Text("Story Name"),
            TextField(
              controller: _storyName,
              decoration: const InputDecoration(
                hintText: "Story Name",
              ),
              onSubmitted: (val) => setState(() {
                _storyName.text = val;
              }),
            ),
            SizedBox(
              height: heigth25,
            ),
            Text("Tags"),
            Wrap(
              spacing: 10,
              children: [
                for (var i in chip) Chip(label: Text(i)),
              ],
            ),
            SizedBox(
              height: heigth25,
            ),
            Text("Short Description"),
            Container(
              margin: EdgeInsets.all(12),
              height: height75,
              child: TextField(
                maxLines: 5,
                controller: _shortdescription,
                decoration: const InputDecoration(
                  hintText: "Enter Short Description",
                  filled: true,
                ),
              ),
            ),

            SizedBox(
              height: heigth25,
            ),
             Text("Full Story"),
            Container(
              margin: const EdgeInsets.all(12),
              height: height200,
              child: TextField(
                maxLines: 20,
                controller: _fulldescription,
                decoration: const InputDecoration(
                  hintText: "Enter Full Description",
                  filled: true,
                ),
              ),
            ),

            SizedBox(
              height: heigth25,
            ),
            ElevatedButton(onPressed: ()=>addposttofirebase(), child: Text("Post Story"))
          ],
        ),
      ),
    );
  }

 
}
