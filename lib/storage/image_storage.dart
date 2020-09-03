import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage storage = FirebaseStorage.instance;

Future<String> uploadImage(File image, String fileName) async {
  StorageUploadTask uploadTask =
      storage.ref().child('images/$fileName.png').putFile(image);
  StorageTaskSnapshot snapshot = await uploadTask.onComplete;
  String imageUrl = await snapshot.ref.getDownloadURL();
  return imageUrl;
}
