import 'package:awesome_app/pages/home_page.dart';
import 'package:awesome_app/pages/home_page_with_fb.dart';
import 'package:awesome_app/pages/home_page_with_sb.dart';
import 'package:awesome_app/pages/login_page.dart';
import 'package:awesome_app/pages/ubuntu_terminal.dart';
import 'package:awesome_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  // WidgetsApp //MaterialApp //CupertinoApp
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getBool("loggedIn") == true
          ? UbuntuTerminal()
          : LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.ubuntuMono().fontFamily,
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
