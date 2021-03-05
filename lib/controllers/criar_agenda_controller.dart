import 'package:flutter/material.dart';
import 'package:tunico/data/models/agenda_model.dart';
import 'package:tunico/data/providers/cloud_firestore_provider.dart';
import 'package:tunico/data/providers/fire_base_auth_provider.dart';
import 'package:tunico/data/repositories/agenda_repository.dart';
import 'package:tunico/data/repositories/usuario_repository.dart';
import 'package:tunico/routes/app_routes.dart';

class CriarAgendaController {
  final _agendaRepository = AgendaRepository();
  
  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();
  final senhaController = TextEditingController();
  final fotoController = TextEditingController();

  final auth = new FireBaseAuthProvider();
  final _usuarioRepository = UsuarioRepository();

  void criarAgenda(BuildContext context) async {
    Map authData = auth.getUserData();
    var agenda = new AgendaModel(
      nome: nomeController.text, 
      descricao: descricaoController.text,
      foto: fotoController.text,
      senha: senhaController.text,
      participantes: [authData['uid']],
    );

    if (agenda.foto != null && !agenda.foto.contains('http')) {
      var cfsp = new CloudFireStoreProvider();
      agenda.foto = await cfsp.uploadAgenda(agenda.foto);
    }

    String idAgenda = await _agendaRepository.incluir(agenda);

    if (idAgenda != null) {
      _usuarioRepository.adicionarAgenda(authData['uid'], idAgenda);
      Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
    } else {
      print('Falha ao cadastrar a Agenda');
    }
  }
}