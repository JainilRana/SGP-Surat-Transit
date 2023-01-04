// import 'package:flutter/material.dart';

// class StopsDropdownMenu extends StatefulWidget {
//   const StopsDropdownMenu({super.key});

//   @override
//   State<StopsDropdownMenu> createState() => _StopsDropdownMenuState();
// }

// class _StopsDropdownMenuState extends State<StopsDropdownMenu> {
//   _StopsDropdownMenuState() {
//     selectStop = stopsName[0];
//   }
//   final stopsName = ["xyz", "abz", "vcz", "iuz", "xjz", "lxyz", "oxyz"];
//   String? selectStop = "";
//   String text = "Select Location..";
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DropdownButtonFormField(
//           value: selectStop,
//           items: stopsName
//               .map((e) => DropdownMenuItem(
//                     child: Text(e),
//                     value: e,
//                   ))
//               .toList(),
//           onChanged: (String? value) {
//             setState(() {
//               selectStop = value as String;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }


// // Column(
// //               children: [
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: Column(
// //                         children: [
// //                           Container(
// //                             width: double.infinity,
// //                             constraints: const BoxConstraints(
// //                                 maxHeight: 45, maxWidth: double.infinity),
// //                             child: Row(children: [
// //                               const Padding(
// //                                 padding: EdgeInsets.all(8.0),
// //                                 child: Icon(
// //                                   Icons.location_searching,
// //                                   size: 20,
// //                                 ),
// //                               ),
// //                               Expanded(
// //                                 child: Padding(
// //                                   padding: const EdgeInsets.all(11.0),
// //                                   child: Text(
// //                                     text,
// //                                     style: TextStyle(color: Colors.black26),
// //                                   ),
// //                                 ),
// //                               ),
// //                               GestureDetector(
// //                                 onTap: (() {
// //                                   setState(() {
// //                                     isStreachedDropDown = !isStreachedDropDown;
// //                                     isStreachedDropDown ? h = 250 : h = 40;
// //                                     isStreachedDropDown ? t = 200 : t = 300;
// //                                   });
// //                                 }),
// //                                 child: Icon(isStreachedDropDown
// //                                     ? Icons.arrow_drop_up
// //                                     : Icons.arrow_drop_down),
// //                               )
// //                             ]),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             )