
import 'package:flutter/material.dart';

Widget categorie(BuildContext context,String  image, {direction})  {
var dir = direction;
  return Container(decoration: BoxDecoration(
    color:Color.fromARGB(58, 255, 255, 255),
    border: Border.all(width: 2,color: Color.fromARGB(255, 255, 255, 255)),
    borderRadius: BorderRadius.circular(5)),
    width:  (MediaQuery.of(context).size.width/2)-46,
    height:(MediaQuery.of(context).size.width/2)-46,
    
    
    child: Column(
    
      children: [Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
              height:(MediaQuery.of(context).size.width/2)-70,
              width: (MediaQuery.of(context).size.width/2)-70,
            child: ButtonTheme(
                     
    height:(MediaQuery.of(context).size.width/2)-100,
                      
                      child: Container(

                                 decoration: BoxDecoration(
                                   border: Border.all(width: 2,color: Color.fromARGB(255, 255, 255, 255)),
                                          borderRadius: BorderRadius.circular(5),),
                        child: RaisedButton(
                     
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(5)
                            ),
                          color: Color.fromARGB(221, 23, 22, 22),
                          child: Image.asset("assets/images/$image"),
                          
                          onPressed: dir ),
                      ),
                    ),
          )
        ],
      ),
              
     
      ],
    ),
  );

}

Widget roomcategorie(BuildContext context,String  image, {direction})  {
var dir = direction;
  return Container(decoration: BoxDecoration(
    color:Color.fromARGB(58, 255, 255, 255),
       border: Border.all(width: 2,color: Color.fromARGB(255, 255, 255, 255)),
    borderRadius: BorderRadius.circular(5)),
    width:  (MediaQuery.of(context).size.width)-46,
    height:(MediaQuery.of(context).size.width/2)-46,
    
    
    child: Column(
    
      children: [Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
              height:(MediaQuery.of(context).size.width/2)-70,
              width: (MediaQuery.of(context).size.width)-70,
            child: ButtonTheme(
                     
    height:(MediaQuery.of(context).size.width/2)-100,
                      
                      child: GestureDetector(
                            onTap: dir,
               
                          child: Container(
                     
                                 decoration: BoxDecoration(
                                   border: Border.all(width: 2,color: Color.fromARGB(255, 255, 255, 255)),
                                          borderRadius: BorderRadius.circular(5),
                                          
                                                 image: DecorationImage(
                image: AssetImage("assets/images/$image"),
                fit: BoxFit.cover),
                  ),
                           
                            child: Padding(padding:  EdgeInsets.all(10),
                            )
                            
                           ),
                        
                      ),
                    ),
          )
        ],
      ),
              
     
      ],
    ),
  );

}

Widget inputText({label, hintext, obsecureText = false,validator}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        // The label
        label,
        style: TextStyle(
            color:Color.fromARGB(255, 0, 110, 255),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Popins'),
      ),
      SizedBox(
        // distance between the label and the input field
        height: 10,
      ),
      TextFormField(
        autofocus: false,
        //our textField
        
        validator: validator,
        obscureText: obsecureText,
        decoration: InputDecoration(
   
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 110, 255),),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 21),
            hintText: hintext,
            hintStyle: TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 0, 0, 0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(15))),
      ),
    ],
  );
}

Widget inputPreRemplis(String initial, {label, hintext, obsecureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        // The label
        label,
        style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Popins'),
      ),
      SizedBox(
        // distance between the label and the input field
        height: 10,
      ),
      TextFormField(
        autofocus: false,
        //our textField
        obscureText: obsecureText,
        initialValue: '$initial',
        decoration: InputDecoration(
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.blue),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 21),
            hintText: hintext,
            hintStyle: TextStyle(fontSize: 14.0, color: Color(0xFF96ACBF)),
            enabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Color(0xFF96ACBF)),
                borderRadius: BorderRadius.circular(15))),
      ),
    ],
  );
}

Widget inputNumber({label, hintext, obsecureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        // The label
        label,
        style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Popins'),
      ),
      SizedBox(
        // distance between the label and the input field
        height: 10,
      ),
      TextFormField(
        autofocus: false,
        //our textField
        keyboardType: TextInputType.number,
        obscureText: obsecureText,
        decoration: InputDecoration(
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 21),
            hintText: hintext,
            hintStyle: TextStyle(fontSize: 14.0, color: Color(0xFF96ACBF)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15))),
      ),
    ],
  );
}


Widget listnom(String nom, String status, String poste, {direction}) {
  var _ontap = direction;
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    "$nom",
                    style: TextStyle(
                        color:Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Popins'),
                  ),
                  new Text(
                    "$status",
                    style: TextStyle(color: Colors.blue),
                  )
                ]),
            subtitle: Text(
              '$poste',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Popins'),
            ),
            onTap: _ontap),
      ]);
}

