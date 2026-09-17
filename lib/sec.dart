import 'package:flutter/material.dart';

class sec extends StatefulWidget{
  const sec({super.key});
  @override
  State<sec> createState() {
    return secState();
  }

}
class secState extends State<sec>{
  Color containerColor = Colors.red;
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar:AppBar(
      title: Text("Test Screen"),
    ),
    body: Column(
      children:[
        Container(
          height: 100,
          width: 100,
          color:containerColor,
        ),
        SizedBox(height: 28),
        ElevatedButton(onPressed:(){
          setState(() {
            containerColor = Colors.blue;
          });

        } ,
          child: Text("Change Color"),
        ),
        SizedBox(height: 28),
        ElevatedButton(onPressed:(){
          setState(() {
            containerColor = Colors.black;
          });
        },
          child: Text("Change Color"),
        ),
          SizedBox(height: 28),
        ElevatedButton(onPressed:(){
          setState(() {
            containerColor = Colors.yellow;
          });
        },
          child: Text("Change Color"),
        ),
      ]
    )
    );
  }
}