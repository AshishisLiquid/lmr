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

  Future<List<Subject>> getAllSubjects() async {
    final snapshot = await _firestore.collection('subjects').get();
    var data = snapshot.docs.map((s) => s.data());
    var subjects = data.map((e) => Subject.fromJson(e));
    return subjects.toList();
  }
}