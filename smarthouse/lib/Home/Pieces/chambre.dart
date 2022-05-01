import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Led/allLed.dart';
import 'package:smarthouse/Home/Volets/allVolet.dart';

class chambre extends StatefulWidget {
  const chambre({ Key? key }) : super(key: key);

  @override
  State<chambre> createState() => _chambreState();
}

class _chambreState extends State<chambre> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                 backgroundColor: Color.fromARGB(221, 23, 22, 22),

        title: Text("Chambre"),
         
      ),
       body: 
            Center(
                 child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("LEDS"),ledChambre(),
                       Text("VOLETS"),voletChambre()
                      

                     ]
                     )
                     )
                     )
        
      
    );
  }
}