import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ZemfoodFirebaseUser {
  ZemfoodFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ZemfoodFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ZemfoodFirebaseUser> zemfoodFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ZemfoodFirebaseUser>(
      (user) {
        currentUser = ZemfoodFirebaseUser(user);
        return currentUser!;
      },
    );
