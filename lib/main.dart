import 'package:crud_application/screens/auth/login_screen.dart';
import 'package:crud_application/screens/auth/register_screen.dart';
import 'package:crud_application/screens/donor/add_donor_data.dart';
import 'package:crud_application/screens/donor/home_screen.dart';
import 'package:crud_application/screens/splash_screen.dart';
import 'package:crud_application/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DonorApp());
}

class DonorApp extends StatefulWidget {
  const DonorApp({Key? key}) : super(key: key);

  @override
  State<DonorApp> createState() => _DonorAppState();
}

class _DonorAppState extends State<DonorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // textButtonTheme: TextButtonThemeData(
          //     style: ButtonStyle(textStyle: MaterialStateProperty<TextStyle>)),
          primarySwatch: Colors.red,
          primaryColor: Colors.orangeAccent),
      home: StreamBuilder(
        stream: AuthService().firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return RegisterScreen();
        },
      ),
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AddDonorData.id: (context) => AddDonorData(),
      },
    );
  }
}
