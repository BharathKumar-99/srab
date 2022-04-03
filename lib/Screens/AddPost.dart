import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:srab/Services/Firestore_method.dart';
import 'package:uuid/uuid.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File? _file;
  late String url;
  List<String> selectedChoices = [];
  ImagePicker picker = ImagePicker();
  final List<String> _filters = [];
  final TextEditingController _storyName = TextEditingController();
  final TextEditingController _shortdescription = TextEditingController();
  final TextEditingController _fulldescription = TextEditingController();







  _selectimage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Create a post"),
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
  void initState() {
    
    super.initState();
    getdata();
  }

  @override
  void dispose() {
    super.dispose();

    _shortdescription.dispose();
    _fulldescription.dispose();
    _storyName.dispose();
  }

  var username = {};
  bool isLoading = true;

  var firebaseUser = FirebaseAuth.instance.currentUser;
  void getdata() async {
    try {
      final firestoreInstance = FirebaseFirestore.instance;
      var snap = await firestoreInstance
          .collection("users")
          .doc(firebaseUser!.uid)
          .get();

      username = snap.data()!;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var twentyheight = height / 39.5;
    var height35 = height / 22.31;
    var heigth25 = height / 31.24;
    var height200 = height / 3.9;
    var height75 = height / 11.61;

    // final User user=Provider.of(context).getUser();

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
          const  Text("Story Name"),
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
          const  Text("Tags"),
            Wrap(
              spacing: 10,
              children: [
                for (var i in chip)
                  FilterChip(
                    backgroundColor: Colors.tealAccent[200],
                    label: Text(i),
                    selected: _filters.contains(i),
                    selectedColor: Colors.purpleAccent,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _filters.add(i);
                        } else {
                          _filters.removeWhere((String name) {
                            return name == i;
                          });
                        }
                      });
                    },
                  ),
              ],
            ),
            SizedBox(
              height: heigth25,
            ),
          const  Text("Short Description"),
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
           const Text("Full Story"),
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
            ElevatedButton(
                onPressed: () async {
                  FirebaseStorage ref = FirebaseStorage.instance;

                  var uuid = const Uuid();
                  var filename = uuid.v1();
                  print(filename);
                  if (_file == null) {
                    print("no");
                   


showDialog(
        context: context,
        builder: (context) {
          return const SimpleDialog(
            title: Text("Error"),
            children: [
              SimpleDialogOption(
                  child: Text("No Image is found"),
              )
                  
            ],
          );
        });





                  } else {
                    try {
                      await ref.ref("Post/$filename").putFile(_file!);

                      url = await ref.ref("Post/$filename").getDownloadURL();
                      FireStoreMethods fireStoreMethods = FireStoreMethods();
                      var res = fireStoreMethods.uploadPost(
                          _storyName.text.trim(),
                          url,
                          username['username'],
                          _shortdescription.text.trim(),
                          firebaseUser!.uid,
                          _fulldescription.text.trim(),
                          _filters);
                     
                    } on FirebaseException catch (e) {
                      print(e);
                      
                    }
                  }
                },
                child: const Text("Post Story"))
          ],
        ),
      ),
    );
  }
}
 
 