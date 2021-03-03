import 'package:flutter/material.dart';
import 'package:tunicoapp/routes/app_routes.dart';
import 'package:tunicoapp/views/pages/barra_pesquisa/index.dart';
import 'package:tunicoapp/views/pages/criar_agenda/index.dart';
import 'package:tunicoapp/views/pages/perfil_usuario/index.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         iconTheme: IconThemeData(color:Colors.white),
        centerTitle: true,
        title: 
        Icon(Icons.home),
        ),
      body: 
      Container(),
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
         showSelectedLabels: false,
        showUnselectedLabels: false,  
       
        items: [
          BottomNavigationBarItem(
            title: Text('home'),
            backgroundColor: Colors.deepOrange[400],
             icon: IconButton(
             icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.HOME);
              }
            )
          ),

          BottomNavigationBarItem(
            title: Text('pesquisar'),
            backgroundColor: Colors.deepOrange[400],
             icon: IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.BARRA_PESQUISA);
              }
            )
          ),

          BottomNavigationBarItem(
            title: Text('nova agenda'),
            backgroundColor: Colors.deepOrange[400],
            icon: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CRIAR_AGENDA);
              }
            )
          ),

          BottomNavigationBarItem(
            title: Text('perfil '),
            backgroundColor: Colors.deepOrange[400],
            icon: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PERFIL_USUARIO);
              }
            )
          ),
      ],
      
      ),
    );
 
  }}