import 'package:flutter/material.dart';
import 'package:tunicoapp/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUNICO APP',
      theme: ThemeData( 
      fontFamily: 'Nunito',
      //backgroundColor: Colors.grey[600],
       primaryColor:Color.fromRGBO(255, 148, 88, 1),
        scaffoldBackgroundColor:Color.fromRGBO(255, 148, 88, 1),
      ),
      
      initialRoute: AppRoutes.TELA_INICIAL,
      routes: AppRoutes.routes,
    );
  }
}
