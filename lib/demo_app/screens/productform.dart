// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_web/demo_app/constants.dart';
// import 'package:flutter_web/demo_app/repository/database.dart';
// import 'package:flutter_web/demo_app/storage/image_storage.dart';
// import 'package:flutter_web/demo_app/widgets/custombutton.dart';
// import 'package:flutter_web/demo_app/widgets/customtextfield.dart';
// import 'package:image_picker/image_picker.dart';

// class ProductForm extends StatefulWidget {
//   @override
//   _ProductFormState createState() => _ProductFormState();
// }

// class _ProductFormState extends State<ProductForm> {
//   String productName;
//   String summary;
//   String description;
//   String price;
//   File image;
//   bool isLoading = false;

//   pickImage() async {
//     PickedFile selectedImage =
//         await ImagePicker().getImage(source: ImageSource.gallery);
//     setState(() {
//       image = File(selectedImage.path);
//     });
//   }

//   onAddProduct() async {
//     setState(() {
//       isLoading = true;
//     });
//     String imageUrl = await uploadImage(image, productName);
//     addProduct(
//       name: productName,
//       summary: summary,
//       description: description,
//       price: price,
//       imageUrl: imageUrl,
//     );
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter Product Details'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           child: Container(
//                             height: 150,
//                             width: 150,
//                             child: image == null
//                                 ? Icon(Icons.add_a_photo, size: 150)
//                                 : Image(
//                                     image: FileImage(image),
//                                     fit: BoxFit.cover,
//                                   ),
//                           ),
//                           onTap: () => pickImage(),
//                         ),
//                         CustomTextField(
//                           focus: true,
//                           hint: 'Product Name',
//                           onChanged: (text) {
//                             setState(() {
//                               productName = text;
//                             });
//                           },
//                         ),
//                         CustomTextField(
//                           hint: 'Product Summary',
//                           length: 50,
//                           onChanged: (text) {
//                             setState(() {
//                               summary = text;
//                             });
//                           },
//                         ),
//                         CustomTextField(
//                           hint: 'Description',
//                           length: 400,
//                           maxlines: 4,
//                           onChanged: (text) {
//                             setState(() {
//                               description = text;
//                             });
//                           },
//                         ),
//                         CustomTextField(
//                           hint: 'Price',
//                           prefix: '₹ ',
//                           keyType: TextInputType.number,
//                           onChanged: (text) {
//                             setState(() {
//                               price = text;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 18.0, bottom: 25),
//                     child: AbsorbPointer(
//                       absorbing: productName == null ||
//                           price == null ||
//                           summary == null ||
//                           description == null,
//                       child: CustomButton(
//                         buttonText: 'Add Product',
//                         buttonColor: productName == null ||
//                                 price == null ||
//                                 summary == null ||
//                                 description == null
//                             ? grey
//                             : indigo,
//                         buttonTextStyle: textStyle(color: white),
//                         horizontalPadding: 70,
//                         onPressed: () => onAddProduct(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
