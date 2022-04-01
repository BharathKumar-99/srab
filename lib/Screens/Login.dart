// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srab/Services/autentication.dart';
import 'package:srab/Utils/CustomColors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailctl = TextEditingController();
  final TextEditingController passwordctl = TextEditingController();

  bool _isloading=false;
  bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final emailfield = TextFormField(
      controller: emailctl,
      onSaved: (value) {
        emailctl.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        hintText: 'Enter your Email',
      ),
      validator: (val) =>
          val!.isEmpty || !val.contains("@") ? "Enter a valid eamil" : null,
    );
    final passwordfield = TextFormField(
      controller: passwordctl,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        hintText: 'Enter Your Password',
        suffixIcon: FlatButton(
            onPressed: _toggle,
            child:
                Icon(_obscureText ? Icons.visibility_off : Icons.visibility)),
      ),
      validator: (val) => val!.length < 6 ? 'Password too short.' : null,
      onSaved: (val) {
        _password = val!;
        _password = val;
        passwordctl.text = val;
      },
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
    );
 var result;
    var height = MediaQuery.of(context).size.height;
    var twentyheight = height / 39.5;
    var height35 = height / 22.31;
    var heigth25 = height35 / 31.24;
    //var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height / 97.625),
          child: ListView(
            
            children: [
              Align(
                alignment: Alignment.topLeft,

                child:
                IconButton(icon: SvgPicture.asset("assets/login_back.svg"), onPressed: () { 
                  Navigator.pop(context);
                 },)
                
                 ),
              SizedBox(
                height: twentyheight,
              ),
              Text("Lets's Sign You In",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: height35,
                      fontWeight: FontWeight.bold)),
              Text("Welcome Back You",
                  style: GoogleFonts.iceland(
                    color: Colors.black,
                    fontSize: 25,
                  )),
              Text("You Were Missed!",
                  style: GoogleFonts.iceland(
                    color: Colors.black,
                    fontSize: 25,
                  ),),
              SizedBox(
                height: height / 45,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(heigth25, 0, heigth25, 0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        emailfield,
                        SizedBox(
                          height: height / 45,
                        ),
                        passwordfield,
                        GestureDetector(
                          onTap: () {},
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 15.4,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                  setState(() {
                    _isloading =true;
                  });
                  
                    if (_formkey.currentState!.validate()) {
                     result=
                   context.read<AuthenticationServices>().signin(
                     email: emailctl.text.trim(),
                     password: passwordctl.text.trim()
                      
                   );
                   Navigator.pushNamed(context, '/Redirector');

                    }
                   print(result);
                    setState(() {
                    _isloading =false;
                  });
                  
                  },
                  child: Padding(
                    padding: EdgeInsets.all(height / 78.1),
                    child:  Text(
                      _isloading?"Loading":
                      "Login",
                      style: TextStyle(fontSize: 25),
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
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.tinos(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/Register'),
                      child: Text(
                        "Create now",
                        style: GoogleFonts.tinos(
                            color: CustomColor.cosmic_red, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
