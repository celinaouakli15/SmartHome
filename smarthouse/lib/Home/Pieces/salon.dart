import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Led/allLed.dart';
import 'package:smarthouse/Home/Volets/allVolet.dart';

class salon extends StatefulWidget {
  const salon({ Key? key }) : super(key: key);

  @override
  State<salon> createState() => _salonState();
}

class _salonState extends State<salon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salon"),
                  backgroundColor: Color.fromARGB(221, 23, 22, 22),

      ),
       body: 
            Center(
                 child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [Text("LEDS"),
                       ledSalon(),
                       Text("VOLETS"),voletSalon()

                     ]
                     )
                     )
                     )
        
      
    );
  }
}