import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Screens/Home.dart';
import 'Screens/Login.dart';
import 'Screens/Register.dart';
import 'Screens/Welcome.dart';
import 'Services/autentication.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<AuthenticationServices>(
            create: (_) => AuthenticationServices(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationServices>().authStatechanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const Autenticationwrapper(),
          "/Welcome":(context) =>const Welcome(), 
          "/Login": (context) => const Login(),
          "/Register": (context) =>  Register(),
          "/Home": (context) => const Home(),
          "/Redirector": (context) => const Autenticationwrapper(),
        },
      ),
    );
  }
}

class Autenticationwrapper extends StatelessWidget {
  const Autenticationwrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser=context.watch<User?>();
    if(firebaseUser != null){
      return const Home();
    }else {
      return const Welcome();
    }
  }
}
