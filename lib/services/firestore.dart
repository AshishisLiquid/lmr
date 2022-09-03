import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lmr/services/auth.dart';
import 'package:lmr/services/models.dart';

class FirestoreService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> getUser(String uid) async {
    final snapshot = await _firestore.collection('users').doc(uid).get();
    return User.fromJson(snapshot.data() ?? {});
  }

  Future<void> createUser(String uid) async{
    await _firestore.collection('users').doc(uid).set({
      'email': AuthService().user!.email,
    });
  }

  Future<void> completeApplication(String uid, String programme, String sem, String displayName) async {
    await _firestore.collection('users').doc(uid).set({
      'programme': programme,
      'sem': sem,
      'displayName': displayName,
    }, SetOptions(merge: true));
  }
}