// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_web/demo_app/constants.dart';
// import 'package:flutter_web/demo_app/repository/database.dart';
// import 'package:flutter_web/demo_app/screens/productform.dart';
// import 'package:flutter_web/demo_app/widgets/custombutton.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   ScrollController scrollController = ScrollController();
//   GlobalKey refreshKey = GlobalKey<RefreshIndicatorState>();
//   Future<QuerySnapshot> products;
//   bool isFav;
//   showProductDetails({name, summary, description, price, id}) {
//     return showDialog(
//         barrierColor: grey,
//         context: context,
//         builder: (_) => Dialog(
//               shape: roundedShape(20),
//               insetPadding: EdgeInsets.symmetric(vertical: 50),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 25),
//                 child: Card(
//                   elevation: 0,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: Padding(
//                               padding: EdgeInsets.only(top: 3),
//                               child: GestureDetector(
//                                 child: Icon(Icons.close, size: 35),
//                                 onTap: () => Navigator.pop(context),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 10),
//                             child: Text(
//                               name,
//                               style: textStyle(fontWeight: FontWeight.w900),
//                             ),
//                           ),
//                           Text(
//                             description,
//                             style: textStyle(),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 25),
//                         child: CustomButton(
//                           buttonText: 'Delete Product',
//                           buttonColor: Colors.red,
//                           buttonTextStyle: textStyle(color: white),
//                           horizontalPadding: 50,
//                           onPressed: () {
//                             deleteProduct(id);
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ));
//   }

//   navigateToProductForm(context) {
//     Navigator.push(context, MaterialPageRoute(builder: (_) => ProductForm()));
//   }

//   updateFavourite(id, fav) {
//     setState(() {
//       isFav = !fav;
//     });
//     updateFav(id, isFav);
//     print(isFav);
//   }

//   Future<void> onRefreshing() async {
//     await getProducts();
//     setState(() {
//       products = getProducts();
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       products = getProducts();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffdddddd),
//       appBar: AppBar(
//         title: Text('Flutter Store'),
//       ),
//       body: RefreshIndicator(
//         key: refreshKey,
//         onRefresh: () => onRefreshing(),
//         child: FutureBuilder<QuerySnapshot>(
//           future: products,
//           builder: (context, snapshot) {
//             int length = snapshot.data.documents.length;
//             return length == 0
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Add Product',
//                           style: textStyle(),
//                         ),
//                         GestureDetector(
//                           child: Text(
//                             '+',
//                             style: textStyle(
//                                 color: indigo,
//                                 size: 150,
//                                 fontWeight: FontWeight.w100),
//                           ),
//                           onTap: () => navigateToProductForm(context),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Scrollbar(
//                     controller: scrollController,
//                     child: GridView.builder(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2, childAspectRatio: 0.8),
//                         itemCount: length + 1,
//                         itemBuilder: (context, index) {
//                           String productName,
//                               summary,
//                               itemDes,
//                               itemPrice,
//                               id,
//                               url;
//                           bool fav;
//                           if (length != index) {
//                             productName =
//                                 snapshot.data.documents[index].data['name'];
//                             summary =
//                                 snapshot.data.documents[index].data['summary'];
//                             itemDes = snapshot
//                                 .data.documents[index].data['description'];
//                             itemPrice =
//                                 snapshot.data.documents[index].data['price'];
//                             url =
//                                 snapshot.data.documents[index].data['imageUrl'];
//                             fav = snapshot.data.documents[index].data['isFav'];
//                             id = snapshot.data.documents[index].documentID;
//                           }

//                           return length == index
//                               ? GestureDetector(
//                                   child: Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Container(
//                                       decoration: ShapeDecoration(
//                                           shape: roundedShape(10),
//                                           color: white),
//                                       child: Center(
//                                         child: Column(
//                                           children: [
//                                             Text(
//                                               '+',
//                                               style: textStyle(
//                                                   color: indigo,
//                                                   size: 130,
//                                                   fontWeight: FontWeight.w100),
//                                             ),
//                                             Text(
//                                               'Add Product',
//                                               style: textStyle(size: 18),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   onTap: () => navigateToProductForm(context),
//                                 )
//                               : InkWell(
//                                   child: Padding(
//                                     padding: EdgeInsets.all(5.0),
//                                     child: Container(
//                                       decoration: ShapeDecoration(
//                                           shape: roundedShape(8), color: white),
//                                       padding: EdgeInsets.all(8),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Stack(
//                                             alignment: Alignment.bottomRight,
//                                             children: [
//                                               Container(
//                                                 height: 160,
//                                                 width: 220,
//                                                 color: white,
//                                                 child: url.isEmpty
//                                                     ? CircularProgressIndicator()
//                                                     : Image(
//                                                         image:
//                                                             NetworkImage(url),
//                                                         fit: BoxFit.contain,
//                                                       ),
//                                               ),
//                                               GestureDetector(
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.all(4.0),
//                                                   child: Icon(
//                                                     Icons.favorite,
//                                                     color:
//                                                         fav ? Colors.red : grey,
//                                                     size: 35,
//                                                   ),
//                                                 ),
//                                                 onTap: () =>
//                                                     updateFavourite(id, fav),
//                                               ),
//                                             ],
//                                           ),
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 productName,
//                                                 style: textStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                               Text(
//                                                 '₹ ' + itemPrice,
//                                                 style: textStyle(size: 16),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   onTap: () => showProductDetails(
//                                     name: productName,
//                                     summary: summary,
//                                     description: itemDes,
//                                     price: itemPrice,
//                                     id: id,
//                                   ),
//                                 );
//                         }),
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }
