import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_protfolio/Binding/controller_binding.dart';
import 'package:my_protfolio/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_protfolio/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // initialRoute: AppPages.INITIAL,
      // getPages:AppPages.routes,
      debugShowCheckedModeBanner: false,
      // initialBinding: ControllerBinding(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>const LoginPage()),
      ],
    );
  }
}
