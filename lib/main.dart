import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:piddle_rolebased/helper/functions.dart';
import 'package:piddle_rolebased/pages/login.dart';
import 'package:piddle_rolebased/pages/teacher.dart';
import 'firebase_options.dart';
import 'pages/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool _isLoggedin = false;
  @override
  // void initState() {
  //   checkUserLoggedInStatus();
  //   super.initState();
  // }

  // checkUserLoggedInStatus() async {
  //   _isLoggedin = (await HelperFunctions.getUserLoggedInDetails())!;
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home:  LoginPage(),
    );
  }
}
