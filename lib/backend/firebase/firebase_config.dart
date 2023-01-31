import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB5sjnjOQ2_0K76Dm8zJRa6N5KQ1sCeuJI",
            authDomain: "zemfood-livraison.firebaseapp.com",
            projectId: "zemfood-livraison",
            storageBucket: "zemfood-livraison.appspot.com",
            messagingSenderId: "134041575527",
            appId: "1:134041575527:web:862733e5ece1054dcdf4c2"));
  } else {
    await Firebase.initializeApp();
  }
}
