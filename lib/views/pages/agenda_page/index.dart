import 'package:flutter/material.dart';
import 'package:tunico2/views/routes/app_routes.dart';

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Image.asset('assets/images/avatar_grupo.png'),
            ),
            SizedBox(width: 15),
            Text(
              'Nome da Agenda',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                //rota para página de edicao da agenda ou dropdown sla ??
              })
        ],
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Pressione o botão "+" abaixo para fazer sua primeira publicação',
          textAlign: TextAlign.center,
        ),
      ),
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
                    //Navigator.of(context).pushNamed(AppRoutes.HOME);
                  })),
          BottomNavigationBarItem(
              title: Text('pesquisar'),
              backgroundColor: Colors.deepOrange[400],
              icon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    //Navigator.of(context).pushNamed(AppRoutes.PESQUISAR_AGENDAS);
                  })),
          BottomNavigationBarItem(
              title: Text('nova postagem'),
              backgroundColor: Colors.deepOrange[400],
              icon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    //pagina de add post
                  })),
          BottomNavigationBarItem(
              title: Text('perfil '),
              backgroundColor: Colors.deepOrange[400],
              icon: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.CRIAR_AGENDA);
                  })),
        ],
      ),
    );
  }
}
