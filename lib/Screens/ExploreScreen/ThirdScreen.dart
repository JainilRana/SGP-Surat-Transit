import 'dart:convert';
import 'dart:ffi';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:surat_transit/Model/exploredatadart.dart';
import 'package:surat_transit/Screens/ExploreScreen/detail_screen.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;



class CustomIcons {
  static const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData option = IconData(0xe902, fontFamily: "CustomIcons");
}

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}
late ExploreSurat a;
class _ExploreScreenState extends State<ExploreScreen> {

  List<ExploreSurat> s=[];
  Map<String,String> places = {};
  Future<void> readJson() async{
    final String data = await rootBundle.loadString("lib/DATA/exploredata.json");
    final redable = json.decode(data);
    for(var i in redable){
      String name = i["name"];
      places[name] = i["data"];
    }
  }

  double currentPage=1.0;

  Future<void> ReadExplore() async{

    var read1 = await rootBundle.loadString("lib/DATA/exploredata.json");
    List<dynamic> list1 = json.decode(read1);
    for (var element in list1) {
      var x=ExploreSurat.fromJson(element);
      s.add(x);
    }
    // currentPage = s.length - 1.0;
  }

  void initState(){
    super.initState();
    print("Loading Json data!");
    readJson();
    print("Data loaded");
    ReadExplore();
    // print(places);
    currentPage=s.length-1.0;
  }

  

  // Future<CardScrollWidget> getData(var currentpage) async{
  //   // List<dynamic> l =  await ReadExplore();
  //
  //   CardScrollWidget x = CardScrollWidget(currentPage,s);
  //   return x;
  // }


  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: s.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.4),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: 200,
                    child: Card(
                      elevation: 20,
                      color: Colors.blueGrey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(child: Text("Explore SURAT!",style: TextStyle(fontSize: 20,fontFamily: "assets/Exo_2",fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
               SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 90),
                      child: SizedBox(
                        width: 370,
                        height: 550,
                        child: Positioned.fill(
                          child: ListView.builder(
                            itemCount: s.length,
                            controller: controller,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return  Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  DetailScreen(s[index])))
                                      );
                                    },

                                    child: Container(
                                      margin: EdgeInsets.only(top: 10,bottom: 10),
                                      child: Favourites(
                                        s[index].name as String,
                                        s[index].image as String,
                                      ),
                                    ),
                                  ),

                                ],
                              );
                              // child: SizedBox(
                              //   height: 450,
                              //     child: CardScrollWidget(currentPage)),
                            },
                          ),
                        ),
                      ),
                    ),


                    // Favourites(
                    //   "Fallen In Love",
                    //   "assets/images/image_03.jpg",
                    // ),
                    // Favourites(
                    //   "Hounted Ground",
                    //   "assets/images/image_04.jpg",
                    // ),
                  ],
                ),
              ),
              // Container(
              //   height: 200,
              //   width: 390,
              //   // margin: EdgeInsets.only(top: 5),
              //   child: Card(
              //     margin: EdgeInsets.only(left: 10,right: 10),
              //     color: Color(0xFF26A69A),
              //     shadowColor: Colors.black26,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(20)),
              //     ),
              //     elevation: 60,
              //     // margin: EdgeInsets.only(top: 150,bottom: 0),
              //       child: Row(
              //         children: [
              //           Text("Hello")
              //         ],
              //       ),
              //   ),
              // ),
              // GlassContainer(
              //   blur: 2,
              //   height: 300,
              //   width: 400,
              //   color: Colors.black26,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class Favourites extends StatelessWidget {
  String title;
  String imageUrl;
  Favourites(
    this.title,
    this.imageUrl,
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 260,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              elevation: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 170,
            bottom: 15,
            child: Container(
              height: 11,
              width: 220,
              child: GlassContainer(
                blur: 4,
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class CardScroll extends StatefulWidget{
//   var currentpage;
//    CardScroll({super.key,this.currentpage});
//   @override
//   CardScrollWidget createState() => CardScrollWidget(currentpage);
// }

// class CardScrollWidget extends StatefulWidget {
//   // String title;
//   // String name;
//   var currentPage;
//   List<ExploreSurat> a;
//
//   CardScrollWidget(this.currentPage,this.a, {super.key});
//
//   @override
//   State<CardScrollWidget> createState() => _CardScrollWidgetState();
// }
//
// class _CardScrollWidgetState extends State<CardScrollWidget> {
//   var padding = 20.0;
//
//   var verticalInset = 20.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: widgetAspectRatio,
//       child: LayoutBuilder(builder: (context, contraints) {
//         var width = contraints.maxWidth;
//         var height = contraints.maxHeight;
//
//         var safeWidth = width - 2 * padding;
//         var safeHeight = height - 2 * padding;
//
//         var heightOfPrimaryCard = safeHeight;
//         var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;
//
//         var primaryCardLeft = safeWidth - widthOfPrimaryCard;
//         var horizontalInset = primaryCardLeft / 2;
//
//         List<Widget> cardList = [];
//
//         for (var i = 0; i<widget.a.length; i++) {
//           var delta = i - widget.currentPage;
//           bool isOnRight = delta > 0;
//
//           var start = padding +
//               max(
//                   primaryCardLeft -
//                       horizontalInset * -delta * (isOnRight ? 15 : 1),
//                   0.0);
//
//           var cardItem = Positioned.directional(
//             top: padding + verticalInset * max(-delta, 0.0),
//             bottom: padding + verticalInset * max(-delta, 0.0),
//             start: start,
//             textDirection: TextDirection.rtl,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16.0),
//               child: Container(
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black12,
//                           offset: Offset(3.0, 6.0),
//                           blurRadius: 10.0)
//                     ]),
//                 child: AspectRatio(
//                   aspectRatio: cardAspectRatio,
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: <Widget>[
//                       GestureDetector(
//                         behavior: HitTestBehavior.translucent,
//                         onTap: () {
//                         print("On tap");
//                          Navigator.push(
//                             context,
//                           MaterialPageRoute(
//                                 builder: ((context) =>
//                                           DetailScreen(widget.a[i])),
//                           ),
//                          );
//                 },
//                         child: Image.asset(widget.a[i].image as String, fit: BoxFit.cover),
//                       ),
//
//                       Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.black54,
//                                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0, vertical: 8.0),
//                                 child: Text(widget.a[i].name as String,
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 25.0,
//                                         fontFamily: "SF-Pro-Text-Regular")),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15.0,
//                             ),
//                             // Padding(
//                             //   padding: const EdgeInsets.only(
//                             //       left: 12.0, bottom: 12.0),
//                             //   child: Container(
//                             //     padding: const EdgeInsets.symmetric(
//                             //         horizontal: 22.0, vertical: 6.0),
//                             //     decoration: BoxDecoration(
//                             //         color: Colors.blueAccent,
//                             //         borderRadius: BorderRadius.circular(20.0)),
//                             //     child: const Text("Read Later",
//                             //         style: TextStyle(color: Colors.white)),
//                             //   ),
//                             // )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//           cardList.add(cardItem);
//         }
//         return Stack(
//           children: cardList,
//         );
//       }),
//     );
//   }
// }
