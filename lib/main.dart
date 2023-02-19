import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:intership_assigment/src/features/Login/presentation/pages/loginScreen.dart';

import 'src/conifg/theme/themes.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Firebase.initializeApp().then((value) => FlutterNativeSplash.remove());
  runApp(const RevamphIntership());
}

class RevamphIntership extends StatelessWidget {
  const RevamphIntership({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: LoginScreen(),
    );
  }
}
