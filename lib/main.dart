


import 'package:flutter/material.dart';
import 'package:onboardingpage2/pages/homepage.dart';
import 'package:onboardingpage2/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));

}


class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  showHome ? Homepage() : OnboardingPage(),
      routes: {
        Homepage.routeName: (context) => Homepage(),
        OnboardingPage.routeName: (context) => OnboardingPage(),
      },
    );
  }
}