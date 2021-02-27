import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yao_app/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userInfo = Firestore.instance.collection('Users');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await userInfo.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return userInfo.snapshots().map(_brewListFromSnapshot);
  }
}
