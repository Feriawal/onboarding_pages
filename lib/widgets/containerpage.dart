
import 'package:flutter/material.dart';


containerPage(
  String title,
  String image,
  String subtitle,
  
) {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Container(
          width: double.infinity,
          height: 400,
          child: Image.asset(image)),
        Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        SizedBox(height: 20),
        Text(subtitle, textAlign: TextAlign.center, style: TextStyle( fontSize: 16)),
      ],
    ),
  );
}