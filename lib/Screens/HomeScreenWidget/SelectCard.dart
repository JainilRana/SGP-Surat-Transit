// import 'package:flutter/material.dart';

// class SelectCard extends StatefulWidget {
//   var pc;
//   var sc;
//   SelectCard(this.pc, this.sc);
//   @override
//   State<SelectCard> createState() => _SelectCardState(pc, sc);
// }

// class _SelectCardState extends State<SelectCard> {
//   var pop;
//   var selected_Station;
//   _SelectCardState(this.pop, this.selected_Station);
//   @override
//   Widget build(BuildContext context) {
//     print('build Card');
//     return Card(
//       elevation: 8,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: 25,
//                   child: Image.asset('assets/images/Animation.gif'),
//                 ),
//               ),
//               TextButton(
//                   onPressed: (() {
//                     setState(() {
//                       pop[0] = !pop[0];
//                       pop[1] = pop[0];
//                     });
//                   }),
//                   child: Text(selected_Station[0])),
//             ],
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: 25,
//                   child: Image.asset('assets/images/Animation-2.gif'),
//                 ),
//               ),
//               TextButton(
//                 onPressed: (() {
//                   setState(() {
//                     pop[0] = !pop[0];
//                     pop[2] = pop[0];
//                   });
//                 }),
//                 child: SizedBox(
//                   width: 220,
//                   child: Text(
//                     selected_Station[1],
//                     overflow: TextOverflow.fade,
//                     maxLines: 2,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
