// import 'dart:html';
//
// import 'dart:html';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/rendering.dart';
import 'package:searchfield/searchfield.dart';

import 'package:sgp_interface/screen/CustomBottombar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const searchroutes(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//  State<searchroutes> createState() =>_searchroutes();
//       ),
//
//     );
//   }
// }

class searchroutes extends StatefulWidget{
  // final String title;
  const searchroutes({Key? key}) : super(key : key);

  State<searchroutes> createState() => _searchroutes();
}

class _searchroutes extends State<searchroutes>{
  Widget build(BuildContext context){
    return Scaffold(

      body: Stack(
        children: [
          Column(
            children: [Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                ),
                // child: Card(
                //   // child: TextButton.icon(onPressed: onPressed, icon: icon, label: label),
                // ),
              ),
            ),
            ],
          ),



          Container(
            height: 430,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60)),
            ),
          ),

          Center(
            child: Container(
              margin: EdgeInsetsDirectional.only(bottom: 300),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  // color: Colors.white,,
                  color: Colors.orange,
                  backgroundBlendMode: BlendMode.color,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(250)),
                  child: Image.asset(
                    "assets/Gifs/road.gif",
                    fit: BoxFit.cover,
                  ),
                )
            ),
          ),
          Center(
            child: Card(
              elevation: 40,
              margin: EdgeInsetsDirectional.only(top: 135),
              shadowColor: Colors.black,
              // surfaceTintColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                width: 300,
                child: TextField(
                  onTap: (){
                    // showSearch(
                    //     context: context,
                    //     delegate: _busroutes());
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text("Bus Routes"),
                          actions: [

                          ],
                        ));
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.orange),borderRadius: BorderRadius.circular(20.0)),
                    hintText: "Select your Bus Routes",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottom(),
    );
  }
}



class _busroutes extends SearchDelegate{
  List<String> routes = [
    "Junagadh-Anand",
    "Junagadh-Nadiad",
    "Anand-Junagadh",
    "Nadiad-Junagadh",
    "Surat-Anand",
    "Surat-Junagadh",
    "Somnath-Ahmedabad",
    "Ahmedabad-Surat",
    "Surat-Jamnagar",
    "Baroda-Veraval",
    "Mangrol-Baroda",
    "Rajkot-Surat"
  ];


  //clear the search field
  @override
  List<Widget>? buildActions(BuildContext context){
    return [
      IconButton(
        onPressed: (){
          query = '';
        },
        icon: Icon(Icons.clear_sharp),
    ),
];
}

@override
Widget? buildLeading(BuildContext context){
    return Container();
}

  Widget buildResults(BuildContext context){
    List<String> matchquery = [];
    for(var route in routes){
      if(route.toLowerCase().contains(query.toLowerCase())){
        matchquery.add(route);
      }
    }

    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context, index){
        var result = matchquery[index];
        return Card(
          child: Row(
            children: [
              Text(result),
              Icon(Icons.arrow_forward),
            ],
          ),
        );
        // return ListTile(
        //   title: Text(result),
        //   // title : Text(result),
        //   //focusColor: Colors.white30,
        //   // tileColor: Colors.yellowAccent,
        // );
      },
    );
  }

  // Widget buildSuggestion(BuildContext context){
  //   List<String> matchQuery = [];
  //
  //   for(var route in routes){
  //     if(route.toLowerCase().contains(query.toLowerCase())){
  //       matchQuery.add(route);
  //     }
  //   }
  //
  //   return ListView.builder(
  //     itemCount: matchQuery.length,
  //       itemBuilder: (context,index){
  //       var result = matchQuery[index];
  //       return ListTile(
  //         title: Text(result),
  //       );
  //       }
  //       );
  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];

    for(var route in routes){
      if(route.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(route);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context,index){
          var result = matchQuery[index];
          return Card(
            child: Row(
              children: [
                Text(result),
                Container(padding: EdgeInsetsDirectional.all(20),height: 50,margin: EdgeInsetsDirectional.only(end: 150),),
                Icon(Icons.arrow_forward),

              ],
            ),
          );
          // return ListTile(
          //   title: Text(result),
          // );
        }
    );
    throw UnimplementedError();
  }
}

