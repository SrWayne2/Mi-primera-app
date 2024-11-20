import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAQ2bCBijP0N4f2w6zt57MXGR_U8NiapqE",
            authDomain: "cultivoa-f20a9.firebaseapp.com",
            projectId: "cultivoa-f20a9",
            storageBucket: "cultivoa-f20a9.firebasestorage.app",
            messagingSenderId: "184857859044",
            appId: "1:184857859044:web:182598636261e2c9002df1"));
  } else {
    await Firebase.initializeApp();
  }
}
