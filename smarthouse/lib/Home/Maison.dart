import 'package:flutter/material.dart';
import 'package:smarthouse/Home/Alarme/alarm.dart';
import 'package:smarthouse/Home/Garage/porteGarage.dart';
import 'package:smarthouse/Home/Led/allLed.dart';
import 'package:smarthouse/Home/Led/addLed.dart';
import 'package:smarthouse/Home/Porte/allPorte.dart';
import 'package:smarthouse/Home/Temperature/allTemperature.dart';
import 'package:smarthouse/Home/Volets/allVolet.dart';
import 'package:smarthouse/Home/enConstruction.dart';


import '../Widgets/widgets.dart';
import 'Led/optionLed.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
           
      body: 
            Center(
                 child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [SizedBox(height: 20,),
                        
                         Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     categorie(context,"on.png",direction: (){   
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const allLed()),
  );} ),
                      SizedBox(width: 20,),
                      categorie(context,"thm.png",direction: (){   
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const allTemperature()),
  );} ),
                        
        ],
        ),SizedBox(height: 20,),
        Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     categorie(context,"alarm.png",direction: (){   
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const allAlarme()),
  );} ),
                      SizedBox(width: 20,),
                      categorie(context,"garage.png",direction: (){   
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => porteGarages()),
  );} ),
                        
        ],
        )
        ,SizedBox(height: 20,),
        Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     categorie(context,"volet.png",direction: (){   
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const allVolet()),
  );} ),
                      SizedBox(width: 20,),
                      categorie(context,"porte.png",direction: (){   
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  allPorte()),
  );} ),
                        
        ],
        )
        ,SizedBox(height: 20,),
       
        ]
        ),
                 ),
               ),
            
   
         
      
    
      
      
    );
  }
}