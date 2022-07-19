import 'package:firebase_database/firebase_database.dart';
import 'user.dart';
 
class UserDao {
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.reference().child('users');
  void saveUser(UserProfile user) {
  _messagesRef.push().set(user.toJson());
}
Query getUserQuery() {
  return _messagesRef;
}
}