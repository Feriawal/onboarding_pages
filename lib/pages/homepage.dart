


import 'package:flutter/material.dart';
import 'package:onboardingpage2/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  static const String routeName = "/homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Homepage"),
        actions: [
          IconButton(onPressed: () async{
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showHome', false);
            Navigator.of(context).pushReplacementNamed(OnboardingPage.routeName);
          }, icon: Icon(Icons.logout))
        ],
        ),
      body: Center(
        child: Text("Homepage", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
      ),
    );
  }
}