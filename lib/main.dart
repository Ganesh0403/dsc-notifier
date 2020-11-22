import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:notification/configuration/local.dart';
import 'package:notification/pages/home.dart';
import 'package:notification/pages/login.dart';
import 'package:notification/pages/otp.dart';
import 'package:notification/pages/profile.dart';
import 'package:notification/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notification/providers/user.dart';
import 'package:provider/provider.dart';

import 'providers/user.dart';

void main() async {
  // Register controllers
  // Example:
  // Get.put(Controller);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color.fromRGBO(240, 240, 240, 1),
      ),
    );

    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: GetMaterialApp(
          title: LocalConfiguration.name,
          debugShowCheckedModeBanner: false,
          // Theme
          theme: ThemeData(
            fontFamily: 'Poppins',
            primarySwatch: Colors.indigo,
            primaryColor: Colors.white,
            accentColor: Colors.indigo,
            cursorColor: LocalConfiguration.dark,
            textSelectionHandleColor: LocalConfiguration.dark,
            textSelectionColor: LocalConfiguration.dark.withOpacity(24 / 100),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: StreamBuilder(
            // ignore: deprecated_member_use
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (ctx,userSnapshot) {
              if (userSnapshot.hasData)
                return HomePage();
              else
                return LoginPage();     
            },
          ),
          getPages: [
            // Register routes
            // Example
            // GetPage(name: '/', page: () => Widget()),
            GetPage(name: '/', page: () => SplashPage()),
            GetPage(name: '/login', page: () => LoginPage(),transition: Transition.fadeIn),
            GetPage(name: '/otp', page: () => OtpPage()),
            GetPage(name: '/profile', page: () => ProfilePage()),
            GetPage(name: '/homePage', page: () => HomePage()),
          ],
        ),
      ),
    );
  }
}
