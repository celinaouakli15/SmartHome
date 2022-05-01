import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Led/allLed.dart';
import 'package:smarthouse/Home/Volets/allVolet.dart';

class garage extends StatefulWidget {
  const garage({ Key? key }) : super(key: key);

  @override
  State<garage> createState() => _garageState();
}

class _garageState extends State<garage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Garage"),
                  backgroundColor: Color.fromARGB(221, 23, 22, 22),

      ),
       body: 
            Center(
                 child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [Text("LEDS"),
                       ledGarage(),
                       Text("VOLETS"),voletGarage()

                     ]
                     )
                     )
                     )
        
      
    );
  }
}