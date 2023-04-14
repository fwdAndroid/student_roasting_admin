import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_roasting_admin/auth/login_page.dart';
import 'package:student_roasting_admin/widgets/sidebar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBSVqkavmDogfwruIF_lVgobMwsQKczj7I",
      authDomain: "studentroasting-bc2c2.firebaseapp.com",
      projectId: "studentroasting-bc2c2",
      storageBucket: "studentroasting-bc2c2.appspot.com",
      messagingSenderId: "305047341427",
      appId: "1:305047341427:web:44adb00a8866fd53915d06",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Roasting',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
