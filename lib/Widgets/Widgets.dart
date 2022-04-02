import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:srab/Utils/CustomColors.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double? size;
 
  final Color? color;
  

  const CustomText({
    required this.text,
    this.size,
    this.color,
      });
  
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.pacifico(fontSize: size,color:Colors.black ),);
  }
}
class CustomTextNor extends StatelessWidget {
  final String text;
  final double? size;
 
  final Color? color;
  

  const CustomTextNor({
    required this.text,
    this.size,
    this.color,
      });
  
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.lobster(fontSize: size,fontWeight: FontWeight.bold),);
  }
}


class Post_card extends StatelessWidget {
  final snap;
  const Post_card({
    Key? key,required this.snap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      height: 200,
                      width: 600,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.asset('assets/download.jpg',
                              fit: BoxFit.cover),
                        ),
                      )),
                  Positioned(
                    child: Container(
                        color:
                            const Color.fromARGB(136, 255, 255, 255),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("Story Name",
                              style: GoogleFonts.abel(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                  ),
                ],
              ),
              Text("Author Name",
                  style: GoogleFonts.abel(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: Text(
                        "Helloasdjanf;lakfn;asnf;afna;sfna;fna;fna;kfna;ksfna;knf;aknf;kasnf;kasnfasdasdasdasdadadasdasdasdasdadasdasdadasd",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
      primary: CustomColor.cosmic_red,
     
      textStyle:const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold)),
                            onPressed: () {},
                            child: const Text("Read")),
                      )),
                ],
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 136, 136, 136),
              blurRadius: 10.0,
              offset: Offset(5, 4)),
        ],
      ),
    );
  }
}


pickImage(ImageSource source)async{
  final ImagePicker _imagepicker=ImagePicker();
  XFile? _file=await _imagepicker.pickImage(source: source);

  if(_file!=null){
    return await _file.readAsBytes();
  }
  return (" no ime");
  print("No Image Selected");
}