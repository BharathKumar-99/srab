import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:srab/Utils/CustomColors.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var  width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 39.5,
            ),
            SizedBox(
                height: height / 2,
                child: SvgPicture.asset("assets/welcome.svg")),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(height / 78.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 39.41,
                  ),
                  Text("Get Started",
                      style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: height / 39.5,
                          fontWeight: FontWeight.bold)),
                  Text(
                    "Publish Your",
                    style: GoogleFonts.tinos(
                        color: Colors.black,
                        fontSize: height / 22.31,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Passion In Your",
                    style: GoogleFonts.tinos(
                        color: Colors.black,
                        fontSize: height / 22.31,
                        fontWeight: FontWeight.normal),
                  ),
                  Row(
                    children: [
                      Text(
                        "Own Way For ",
                        style: GoogleFonts.tinos(
                            color: Colors.black,
                            fontSize: height / 22.31,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Free ",
                        style: GoogleFonts.tinos(
                            color: Colors.black,
                            fontSize: height / 22.31,
                            fontWeight: FontWeight.w900, // light
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Register');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(height / 78.1),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: height / 31.24,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: 2.0,
                            color: CustomColor.cosmic_red,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          primary: CustomColor.cosmic_red,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Login');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(height / 78.1),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: CustomColor.cosmic_red,
                              fontSize: height / 31.24,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: 2.0,
                            color: CustomColor.cosmic_red,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          primary: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
