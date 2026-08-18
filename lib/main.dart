import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false ,
    home: Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        leading:Icon(Icons.arrow_upward,
        size: 30,) ,
        title:Text('Task Page',
        style: TextStyle(
          color: Colors.purpleAccent,
          fontSize: 30
        ),
        ) ,
        actions: [
          Icon(Icons.check_circle,
          color: Colors.green,
          size: 35,
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center ,
        children: [
          Text('Hello World',
          textAlign:TextAlign.center ,
          style:TextStyle(
            fontSize:50,
          fontWeight:FontWeight.bold  
          ) ,
          ),
          Icon(Icons.favorite_border,
          color:Colors.purple ,
          size:45) ,
          Row(
            mainAxisAlignment:MainAxisAlignment.start ,
            children: [
              Text('Task1',
              style: TextStyle(
                fontSize:50 
              ),),
              Icon(Icons.favorite_border,
              color:Colors.pink ,
              size: 45,
              )
             
            ],
          )

        ],
      ),
    ),
  ));
}
 
  

