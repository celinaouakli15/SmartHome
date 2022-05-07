import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Alarme/alarm.dart';
import 'package:smarthouse/Home/Led/allLed.dart';
import 'package:smarthouse/Home/Porte/allPorte.dart';
import 'package:smarthouse/Home/Volets/allVolet.dart';

class cuisine extends StatefulWidget {
  const cuisine({ Key? key }) : super(key: key);

  @override
  State<cuisine> createState() => _cuisineState();
}

class _cuisineState extends State<cuisine> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuisine"),
                  backgroundColor: Color.fromARGB(221, 23, 22, 22),

      ),
       body: 
            Center(
                 child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [Text("LEDS"),
                       ledCuisine(),
                       Text("VOLETS"), 
                       voletCuisine(),
                        Text("Alarme"), 
                       alarmeCuisine(),
                          Text("Porte"), 
                      porteCuisine()

                     ]
                     )
                     )
                     )
        
      
    );
  }
}