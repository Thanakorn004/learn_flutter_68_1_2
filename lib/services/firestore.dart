
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference persons = FirebaseFirestore.instance.collection(
    'persons',
  );


  Future<void> addPerson(String personName, String personEmail, int personAge) {
    return persons.add({
      'personName': personName,
      'personEmail': personEmail,
      'personAge': personAge,
      'createdAt': Timestamp.now(),
    });
  }


  Stream<QuerySnapshot> getPersons() {
    return persons.orderBy('createdAt', descending: true).snapshots();
  }


  Future<Map<String, dynamic>?> getPersonById(String id) async {
    DocumentSnapshot doc = await persons.doc(id).get();
    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }
}

