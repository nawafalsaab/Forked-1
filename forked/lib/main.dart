import 'package:flutter/material.dart';
import 'package:forked/Views/CreateRecipe.dart';
import 'package:forked/Views/ViewRecipe.dart';


import 'package:get/get.dart';
import 'package:forked/Routes/Router.dart';
import 'package:forked/Views/RegistrationNav.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: NamedRoute.StratingPage,
      // getPages: appRoutes,


      //home: ViewRecipe(),

 home: createRecipe(

steps: [

  SizedBox(),
    SizedBox(),

  SizedBox(),

],




ingredients: [

  SizedBox(),

  SizedBox(),

],

 ),
 //home: ProfilEdiet(),


    );
  }
}
