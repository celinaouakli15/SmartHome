import 'package:flutter/material.dart';

class construction extends StatefulWidget {
  const construction({ Key? key }) : super(key: key);

  @override
  State<construction> createState() => _constructionState();
}

class _constructionState extends State<construction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
          body: Center(
            child:
           Image.asset("assets/images/construction.gif")),

             
      
    );
  }
}