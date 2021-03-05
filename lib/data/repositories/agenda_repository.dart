import 'package:tunico/data/models/agenda_model.dart';
import 'package:tunico/data/providers/agenda_provider.dart';

class AgendaRepository {
  final _provider = AgendaProvider();

  Future<String> incluir(AgendaModel agenda) async {
    try {
      String id = await _provider.incluir(agenda.toMap());
      return id;
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<bool> alterar(AgendaModel agenda) async {
    try {
      await _provider.alterar(agenda.toMap());
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> excluir(AgendaModel agenda) async {
    try {
      await _provider.excluir(agenda.id);
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<List<AgendaModel>> selecionarTodos({List agendas}) async {
    try {
      var map = await _provider.selecionarTodos(agendas: agendas);
      var lista = new List<AgendaModel>();
      for (int i = 0; i < map.length; i++) {
        lista.add(AgendaModel.fromMap(map[i]));
      }
      return lista;
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}