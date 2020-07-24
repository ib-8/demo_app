import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/repository/database.dart';
import 'package:flutter_web/screens/productform.dart';
import 'package:flutter_web/widgets/custombutton.dart';

class HomePage extends StatelessWidget {
  showProductDetails(context, {name, summary, description, price, id}) {
    return showDialog(
        barrierColor: grey,
        context: context,
        builder: (_) => Dialog(
              shape: roundedShape(20),
              insetPadding: EdgeInsets.symmetric(vertical: 50),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Card(
                  elevation: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: GestureDetector(
                                child: Icon(Icons.close, size: 35),
                                onTap: () => Navigator.pop(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              name,
                              style: textStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                          Text(
                            description,
                            style: textStyle(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: CustomButton(
                          buttonText: 'Delete Product',
                          buttonColor: Colors.red,
                          buttonTextStyle: textStyle(color: white),
                          horizontalPadding: 50,
                          onPressed: () {
                            deleteProduct(id);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  navigateToProductForm(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductForm()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Store'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getProducts(),
        builder: (context, snapshot) {
          int length = snapshot.data.documents.length;
          return length == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Product',
                        style: textStyle(),
                      ),
                      GestureDetector(
                        child: Text(
                          '+',
                          style: textStyle(
                              color: indigo,
                              size: 150,
                              fontWeight: FontWeight.w100),
                        ),
                        onTap: () => navigateToProductForm(context),
                      ),
                    ],
                  ),
                )
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: length,
                        itemBuilder: (context, index) {
                          String productName =
                              snapshot.data.documents[index].data['name'];
                          String summary =
                              snapshot.data.documents[index].data['summary'];
                          String itemDes = snapshot
                              .data.documents[index].data['description'];
                          String itemPrice =
                              snapshot.data.documents[index].data['price'];
                          String id = snapshot.data.documents[index].documentID;
                          return InkWell(
                            child: Card(
                              elevation: 5,
                              shape: roundedShape(10),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: GridTile(
                                  header: Center(
                                      child: Text(productName,
                                          style: textStyle(
                                              size: 23,
                                              fontWeight: FontWeight.w900))),
                                  child: Center(
                                      child: Text(summary,
                                          style: textStyle(size: 20))),
                                  footer: Center(
                                      child: Text('₹ ' + itemPrice,
                                          style: textStyle(
                                              size: 22,
                                              fontWeight: FontWeight.w500))),
                                ),
                              ),
                            ),
                            onTap: () => showProductDetails(
                              context,
                              name: productName,
                              summary: summary,
                              description: itemDes,
                              price: itemPrice,
                              id: id,
                            ),
                          );
                        }),
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: CustomButton(
                        buttonColor: indigo,
                        buttonText: 'Add Products',
                        buttonTextStyle: textStyle(color: white, size: 25),
                        horizontalPadding: 100,
                        onPressed: () => navigateToProductForm(context),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
