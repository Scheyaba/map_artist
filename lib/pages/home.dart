import 'package:flutter/material.dart';


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return new MaterialApp(
      title:'Flutter Demo',
      home:Text(
        'Hello,Flutter World!!',
        style: TextStyle(fontSize:32.0),
        )
    );
  }
}
