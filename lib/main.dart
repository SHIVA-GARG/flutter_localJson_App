import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main()=>runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal,
  ),
  home: new HomePage(),
),);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter load json"),
      ),
      body: new Container(
        child: new Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
            .of(context)
            .loadString('load_json/person.json'),
            // ignore: missing_return
            builder: (context,snapshot){
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context,int index){
                  return new Card(
                    child: new Column(
                      children: [
                       // new Text("Id:"+mydata[index]['id']),
                        new Text("Name:"+mydata[index]['name'],style: new TextStyle(color: Colors.teal[700],fontSize: 18.0,),),
                        new Text("Age:"+mydata[index]['age'],style: new TextStyle(color: Colors.pink[500],fontSize: 18.0,),),
                        new Text("Gender:"+mydata[index]['gender'],style: new TextStyle(color: Colors.pink[500],fontSize: 18.0,),),
                        new Text("HairColor:"+mydata[index]['hair_color'],style: new TextStyle(color: Colors.pink[500],fontSize: 18.0,),),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null?0:mydata.length,
              );
            },
          ),
          ),
        ),
      );
  }

  
}