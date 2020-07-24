import 'package:cloud_firestore/cloud_firestore.dart';

Firestore firestore = Firestore.instance;

addProduct({name, summary, description, price, imageUrl}) {
  firestore.collection('products').add({
    'name': name,
    'summary': summary,
    'description': description,
    'price': price,
    'imageUrl': imageUrl,
    'isFav': false,
  });
}

Future<void> updateFav(id, fav) async {
  await firestore.collection('products').document(id).updateData({
    'isFav': fav,
  });
  print('called');
}

Stream<QuerySnapshot> getProducts() {
  var snapshot;
  try {
    snapshot = firestore.collection('products').orderBy('name').snapshots();
  } catch (e) {}

  return snapshot;
}

deleteProduct(id) {
  firestore.collection('products').document(id).delete();
}
