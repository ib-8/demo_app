import 'package:cloud_firestore/cloud_firestore.dart';

Firestore firestore = Firestore.instance;

addProduct({name, summary, description, price}) {
  firestore.collection('products').add({
    'name': name,
    'summary': summary,
    'description': description,
    'price': price,
  });
}

Stream<QuerySnapshot> getProducts() {
  return firestore.collection('products').orderBy('name').snapshots();
}

deleteProduct(id) {
  firestore.collection('products').document(id).delete();
}
