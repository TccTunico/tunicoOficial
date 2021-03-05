import 'package:flutter/material.dart';
import 'package:tunico/controllers/home_controller.dart';
import 'package:tunico/routes/app_routes.dart';
import 'package:tunico/views/components/TextFormFieldExt/index.dart';
import 'package:tunico/views/components/card_agendas/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = new HomeController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    _controller.atualizarItens().then((value) {
      setState(() {});
    });
  }

  void pesquisar() {
    _controller.pesquisar().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Icon(Icons.home),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white),
              onPressed: () {
                _controller.sair(context);
              })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          carregarDados();
        },
        child: ListView.builder(
          itemCount: _controller.itens.length+1,
          itemBuilder: (context, index) {
            if (_controller.itens.length == 0 || _controller.itens == null){
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text("Você não pertence a nehuma agenda"),
                ),
              );
            }
            if(index == 0){
              return Padding(
                padding: EdgeInsets.all(10),
                child: TextFormFieldExt(
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Pesquisar',
                  controller: _controller.pesquisaController,
                  onChanged: (String _controller) {
                    pesquisar();
                  },
                ),
              );
            }
            var item = _controller.itens[index-1];
            return CardAgenda(
              image: Image.network(item.foto),
              nome: item.nome,
              descricao: item.descricao,
              uid: item.id,
              urlImage: item.foto,
              // onDelete: (uid) {
              //   _controller.excluirItem(uid);
              // },
              onRefresh: () {
                carregarDados();
              },
            );
          }
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
                    Navigator.of(context).pushNamed(AppRoutes.PESQUISAR_AGENDAS);
                  })),
          BottomNavigationBarItem(
              title: Text('nova agenda'),
              backgroundColor: Colors.deepOrange[400],
              icon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.CRIAR_AGENDA);
                  })),
          BottomNavigationBarItem(
              title: Text('perfil '),
              backgroundColor: Colors.deepOrange[400],
              icon: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    //Navigator.of(context).pushNamed(AppRoutes.PERFIL_USUARIO);
                  })),
        ],
      ),
    );
  }
}
