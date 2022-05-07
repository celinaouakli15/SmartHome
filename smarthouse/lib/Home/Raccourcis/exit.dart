import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class exit extends StatefulWidget {
  const exit({ Key? key }) : super(key: key);

  @override
  State<exit> createState() => _exitState();
}

class _exitState extends State<exit> {
 bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
         title: Text("Sortie du Domicile"),
      ),
      body:
      
   Center(
        child:  SingleChildScrollView(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              
            Container(
               margin: const EdgeInsets.fromLTRB(20,0,20,0),
                width: 400,
                height: 350,
              child: Image.asset('assets/images/${value!=true?'exit.jpeg':'exitoff.jpeg'}',
              )
              
              ),
       
              SizedBox(height: 20,),
            
    
   Container(
                    margin: const EdgeInsets.fromLTRB(20,0,20,0),
                   decoration: BoxDecoration(border: Border.all(width: 2,color: Color.fromARGB(255, 255, 255, 255)),
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color.fromARGB(255, 66, 66, 66)
                                            
                    ),
                    child: Column(children: [
                      Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                children: [ SizedBox(width: 10,),
                IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {  },
          ),
                  Expanded(
                    child: Text('Sortie ${value!=true?'Désactivé':'Activé'}',
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,)),
                  ),
                  
                  SwitchLed(), 
                ],
              ),
                      Divider(color: Color.fromARGB(255, 255, 255, 255),),
                      Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                children: [ SizedBox(width: 10,),
                IconButton(icon: Icon(Icons.door_back_door), onPressed: () {  },
          ),
                  Expanded(
                    child: Text('Issues',
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                   Expanded(
                    child: Text('${value!=true?'Ouvert':'Fermer'}',
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
               
                ],
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                children: [ SizedBox(width: 10,),
                IconButton(icon: Icon(Icons.lightbulb), onPressed: () {  },
          ),
                  Expanded(
                    child: Text('Lumières',
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                   Expanded(
                    child: Text('${value!=true?'Allumées':'Éteintes'}',
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,)),
                  ),
               
                ],
              ),
               Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                children: [ SizedBox(width: 10,),
                IconButton(icon: Icon(Icons.volume_down), onPressed: () {  },
          ),
                  Expanded(
                    child: Text('Alarme',
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
                   Expanded(
                    child: Text('${value!=true?'Désactivé':'Activé'}',
                          style: TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,),),
                  ),
               
                ],
              ),
                    
                    
                    ],)
                    )

          
      ],
      ),
        ),
      )
      
    );
  } 

    void fonctionRequette(switchStatus) {
   
    try{ if(value== false){
       print("requette pour activer EXIT");

       
       
    }
     else{
 
     print("requette pour Desactiver EXIT ");
     }
       
    }
    finally{

   
      setState(() {
      value = !value;
    });
    }

}

 Widget SwitchLed() => Transform.scale(
     
        
        scale: 1.1,
        child: CupertinoSwitch(
          activeColor: Colors.green,
          trackColor: Colors.orange,
          value: value ,
          onChanged: (value) => fonctionRequette(() => this.value = value ,),
     
         
          
        ),
      );


}