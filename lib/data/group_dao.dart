import 'package:firebase_database/firebase_database.dart';
import 'group.dart';
 
class GroupDao {
  final DatabaseReference _groupRef =
      FirebaseDatabase.instance.reference().child('GroupTransactions');
  void saveGroup(GroupTransaction grp) {
  _groupRef.push().set(grp.toJson());
}
Query getGroupQuery() {
  return _groupRef;
}
}