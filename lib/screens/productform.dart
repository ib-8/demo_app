import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/repository/database.dart';
import 'package:flutter_web/widgets/custombutton.dart';
import 'package:flutter_web/widgets/customtextfield.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  String productName;
  String summary;
  String description;
  String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  CustomTextField(
                    focus: true,
                    hint: 'Product Name',
                    onChanged: (text) {
                      setState(() {
                        productName = text;
                      });
                    },
                  ),
                  CustomTextField(
                    hint: 'Product Summary',
                    length: 50,
                    onChanged: (text) {
                      setState(() {
                        summary = text;
                      });
                    },
                  ),
                  CustomTextField(
                    hint: 'Description',
                    length: 400,
                    maxlines: 4,
                    onChanged: (text) {
                      setState(() {
                        description = text;
                      });
                    },
                  ),
                  CustomTextField(
                    hint: 'Price',
                    prefix: '₹ ',
                    keyType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        price = text;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: AbsorbPointer(
                absorbing: productName == null ||
                    price == null ||
                    summary == null ||
                    description == null,
                child: CustomButton(
                  buttonText: 'Add Product',
                  buttonColor: productName == null ||
                          price == null ||
                          summary == null ||
                          description == null
                      ? grey
                      : indigo,
                  buttonTextStyle: textStyle(color: white),
                  horizontalPadding: 70,
                  onPressed: () {
                    addProduct(
                        name: productName,
                        summary: summary,
                        description: description,
                        price: price);
                    Navigator.pop(context);
                    print(price);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
