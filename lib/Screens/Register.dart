// ignore_for_file: non_constant_identifier_names, unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srab/Services/autentication.dart';
import 'package:srab/Utils/CustomColors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkeyregister = GlobalKey<FormState>();
  final _Scafoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController emailsignup = TextEditingController();
  final TextEditingController passwordsignup = TextEditingController();
  final TextEditingController confirmpasswordsignup = TextEditingController();
  final TextEditingController signupname = TextEditingController();
  bool _isloading = false;
  bool _obscureText = true;

  late String _password;
  late String _passwordlength;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var twentyheight = height / 39.5;
    var height35 = height / 22.31;
    var heigth25 = height35 / 31.24;

    final emailfield = TextFormField(
      controller: emailsignup,
      onSaved: (value) {
        emailsignup.text = value!;
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
    final emailName = TextFormField(
      controller: signupname,
      onSaved: (value) {
        signupname.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.cosmic_red, width: 2.0),
        ),
        hintText: 'Enter your Name',
      ),
    );
    final passwordfield = TextFormField(
      controller: passwordsignup,
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
        _passwordlength = val!;
        _password = val;
        passwordsignup.text = val;
      },
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
    );
    final confirmPasswordfield = TextFormField(
      controller: confirmpasswordsignup,
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
        hintText: 'Confirm Your Password',
        suffixIcon: FlatButton(
            onPressed: _toggle,
            child:
                Icon(_obscureText ? Icons.visibility_off : Icons.visibility)),
      ),
      validator: (val) => val!.length < 6 ? 'Password too short.' : null,
      onSaved: (val) {
        _passwordlength = val!;
        _password = val;
        confirmpasswordsignup.text = val;
      },
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height / 97.625),
          child: ListView(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset("assets/login_back.svg")),
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
              Text(
                "You Were Missed!",
                style: GoogleFonts.iceland(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: height / 45,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(heigth25, 0, heigth25, 0),
                child: Form(
                  key: _formkeyregister,
                  child: Column(
                    children: [
                      emailName,
                      SizedBox(
                        height: height / 45,
                      ),
                      emailfield,
                      SizedBox(
                        height: height / 45,
                      ),
                      passwordfield,
                      SizedBox(
                        height: height / 45,
                      ),
                      confirmPasswordfield,
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
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: ()async {
                    setState(() {
                      _isloading = true;
                    });
                    if (_formkeyregister.currentState!.validate()) {
                      var res=await context.read<AuthenticationServices>().signup(email: emailsignup.text, fullName: signupname.text,
                     password: passwordsignup.text,);
Navigator.pushNamed(context, '/Redirector');
                    }
                   
                    setState(() {
                      _isloading = false;
                    });
                   
                  },
                  child: Padding(
                    padding: EdgeInsets.all(height / 78.1),
                    child: Text(
                      _isloading ? "Loading" : "Signup",
                      style: const TextStyle(fontSize: 25),
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
              Align(
               alignment: Alignment.bottomCenter,
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: GoogleFonts.tinos(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/Login'),
                  child: Text(
                    "Signin now",
                    style: GoogleFonts.tinos(
                        color: CustomColor.cosmic_red, fontSize: 20),
                  ),
                ),
              ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
