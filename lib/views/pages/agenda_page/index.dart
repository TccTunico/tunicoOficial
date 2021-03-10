import 'package:flutter/material.dart';
import 'package:tunico2/views/components/card_post/index.dart';
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
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: [
            CardPost(
              uid: 'varios n° nadave',
              foto: Image.asset('assets/images/avatar_ruiva.png'),
              autor: 'ruiva',
              texto:
                  'Lorem ipsum dollar statment ha achou mesmo mané aq é tudo digitado a mão, código artesanal feito com muito amor e carinho (lê-se sofrimento) || Lorem ipsum dollar statment ha achou mesmo mané aq é tudo digitado a mão, código artesanal feito com muito amor e carinho (lê-se sofrimento)',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 255, 107, 107),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.CRIAR_POST);
        },
      ),
    );
  }
}
