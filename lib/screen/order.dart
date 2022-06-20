// import 'package:flutter/material.dart';
// import '../../../providers/items.dart';
// import '../../../models/item.dart';
// import 'package:provider/provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);
//   static const routeName = '/CartScreen';

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   Future<void> fetchData(BuildContext context) async {
//     await Provider.of<Items>(context, listen: false).fetchData();
//   }

//   void clickItem(Item item) {
//     debugPrint(item.toString());
//   }

//   int _counter = 0;
//   late int finalprice;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrementCounter() {
//     setState(() {
//       _counter--;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 500,
//               child: Consumer<Items>(builder: (context, data, child) {
//                 final items = data.items;
//                 return RefreshIndicator(
//                   onRefresh: () => fetchData(context),
//                   child: ListView.builder(
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           leading: SizedBox(
//                             height: 150,
//                             width: 80,
//                             child: Image.network(
//                               items[index].image!,
//                               height: 150,
//                               width: 100,
//                             ),
//                           ),
//                           title: Text(items[index].name!),
//                           subtitle: Stack(
//                             children: [
//                               Expanded(
//                                   child: Row(
//                                 children: [
//                                   SizedBox(
//                                     height: 25,
//                                     width: 30,
//                                     child: FloatingActionButton(
//                                       onPressed: () {
//                                         if (_counter > 0) {
//                                           _decrementCounter();
//                                         }
//                                       },
//                                       heroTag: 'Decrement',
//                                       shape: const RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(10.0),
//                                         ),
//                                       ),
//                                       child: const Icon(Icons.remove),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 25,
//                                     width: 30,
//                                     child: Center(
//                                       child: Text("$_counter"),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 25,
//                                     width: 30,
//                                     child: FloatingActionButton(
//                                       onPressed: _incrementCounter,
//                                       heroTag: 'Increment',
//                                       shape: const RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(10.0),
//                                         ),
//                                       ),
//                                       child: const Icon(Icons.add),
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                             ],
//                           ),
//                           // trailing: Stack(
//                           //   children: [
//                           //     Expanded(
//                           //         child: Row(
//                           //       mainAxisAlignment: MainAxisAlignment.end,
//                           //       children: [
//                           //         FloatingActionButton(
//                           //           onPressed:
//                           //               //  _decrementCounter,
//                           //               () {
//                           //             if (_counter > 0) {
//                           //               _decrementCounter();
//                           //             }
//                           //           },
//                           //           heroTag: 'Decrement',
//                           //           shape: const RoundedRectangleBorder(
//                           //             borderRadius: BorderRadius.all(
//                           //               Radius.circular(10.0),
//                           //             ),
//                           //           ),
//                           //           child: const Icon(Icons.remove),
//                           //         ),
//                           //         SizedBox(
//                           //           height: 20,
//                           //           width: 50,
//                           //           child: Center(
//                           //             child: Text("$_counter"),
//                           //           ),
//                           //         ),
//                           //         FloatingActionButton(
//                           //           onPressed: _incrementCounter,
//                           //           heroTag: 'Increment',
//                           //           shape: const RoundedRectangleBorder(
//                           //             borderRadius: BorderRadius.all(
//                           //               Radius.circular(10.0),
//                           //             ),
//                           //           ),
//                           //           child: const Icon(Icons.add),
//                           //         ),
//                           //       ],
//                           //     )),
//                           //   ],
//                           // )
//                         );
//                       },
//                       itemCount: items.length),
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
