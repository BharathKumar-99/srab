import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../Widgets/Widgets.dart';

class AddPost extends StatefulWidget {
  AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
 
Uint8List? _file;

_selectimage(BuildContext context)async{
  return showDialog(context: context, builder: (context){

      return SimpleDialog(
title:Text("Create a post") ,
children: [
  SimpleDialogOption(
    
child: const Text("Choose from gallery",),
onPressed: () async{
  Navigator.of(context).pop();
  Uint8List file=await pickImage(ImageSource.gallery);


  setState(() {
    _file = file;
  });
}
  )
],
      );
  });
}

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var twentyheight = height / 39.5;
    var height35 = height / 22.31;
    var heigth25 = height / 31.24;
    var height200 = height / 3.9;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Add Story",style: TextStyle(color: Colors.black),),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text("Add Cover for the Story ",style : GoogleFonts.lato(fontSize: 23)),
            SizedBox(height: heigth25,),
            GestureDetector(
              onTap:()=> _selectimage(context),
              child: SizedBox(
                height: height200,
                width: double.infinity,
                child:  _file == null
                        ? Text("No Image is picked")
                        : Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: MemoryImage(_file!),
                            fit: BoxFit.fill
                            )
                            
                          ),
                        )
                        
              ),
            )
          ],
        ),
      ),
    );
  }
}



