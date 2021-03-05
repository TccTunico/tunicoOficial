import 'package:flutter/cupertino.dart';
import 'package:tunico/data/models/agenda_model.dart';
//import 'package:tunico/data/models/usuario_model.dart';
import 'package:tunico/data/providers/fire_base_auth_provider.dart';
import 'package:tunico/data/repositories/agenda_repository.dart';
//import 'package:tunico/data/repositories/usuario_repository.dart';

class PesquisarController{
  final _agendaRepository = new AgendaRepository();
  final pesquisaController = TextEditingController();
  //final _usuarioRepository = UsuarioRepository();
  List<AgendaModel> itens = new List<AgendaModel>();
  List<AgendaModel> _listaItens = new List<AgendaModel>();
  final auth = new FireBaseAuthProvider();

  Future<void> atualizarItens() async {
    print("Atualizar itens");
    try{
      // Map authData = auth.getUserData();
      // UsuarioModel usuarioData = await _usuarioRepository.selecionarPorId(authData['uid']);
      //if (usuarioData.agendas != null){
        _listaItens = await _agendaRepository.selecionarTodos();
        pesquisar();
      //}
    }
    catch (ex){
      
    }
  }

  Future<void> pesquisar() async{
    itens.clear();
    if (pesquisaController.text == ""){
      for (int i = 0; i < _listaItens.length; i++) {
        itens.add(_listaItens[i]);
      }
    }
    else {
      print("Pesquisa");
      print(_listaItens.length);
      for (int i = 0; i < _listaItens.length; i++) {
        if (_listaItens[i].nome.contains(pesquisaController.text)) {
          print(_listaItens[i].nome);
          itens.add(_listaItens[i]);
        }
      }
    }
  }
}