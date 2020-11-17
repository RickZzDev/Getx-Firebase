import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  String name;
  String email;
  String urlImage;

  UserModel({this.id, this.name, this.email, this.urlImage});

  UserModel.fromSnapshot(FirebaseUser user)
      : id = user.uid,
        email = user.email,
        name = user.displayName,
        urlImage = user.photoUrl;

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "urlImage": urlImage};
  }
}
