import 'package:cloud_firestore/cloud_firestore.dart';

Firestore db = Firestore.instance;

Future<String> insertQStr(qStr) async {
  String docId = '';
  DocumentReference df =
      await db.collection('CodeShare').add({'qStrJaon': qStr});
  docId = df.documentID;
  if (docId.length == 0)
    return '新增錯誤';
  else
    return docId;
}

Future<String> selectQStr(docId) async {
  DocumentSnapshot ds = await db.collection('CodeShare').document(docId).get();
  String qStrJaon = '';
  if (!ds.exists) return '找不到';
  qStrJaon = ds.data['qStrJaon'];
  return qStrJaon;
}
