import 'package:tunico/data/models/usuario_model.dart';
import 'package:tunico/data/providers/fire_base_auth_provider.dart';
import 'package:tunico/data/providers/usuario_provider.dart';

class UsuarioRepository{

  static final UsuarioProvider _provider = UsuarioProvider();
  
  static final _auth = new FireBaseAuthProvider();

  Future<bool> incluir(UsuarioModel usuario, String senha) async{
    try{
      var mapLogin = await _auth.criarUsuario(usuario.email, senha);
      if (mapLogin != null) {
        var id = mapLogin['id'];
        await _provider.incluir(usuario.toMap(), id);
        return true;
      }
      return false;
    }catch (ex){
      print(ex);
      return false;
    }
  }

  Future<bool> alterar(UsuarioModel usuario) async{
    try{
      await _provider.alterar(usuario.toMap());
      return true;
    }catch (ex){
      print(ex);
      return false;
    }
  }

  Future<bool> adicionarAgenda(String idUsuario, String idAgenda) async{
    try{
      await _provider.adicionarAgenda(idUsuario, idAgenda);
      return true;
    }catch(ex){
      print(ex);
      return false;
    }
  }

  Future<bool> excluir(UsuarioModel usuario) async{
    try{
      await _provider.excluir(usuario.toMap());
      return true;
    }catch (ex){
      print(ex);
      return false;
    }
  }

  Future<UsuarioModel> selecionarPorId(String id) async{
    try{
      var map = await _provider.selecionarPorId(id);

      return map.length > 0 ? UsuarioModel.fromMap(map) : null;
      
    }catch (ex){
      print(ex);
      return null;
    }
  }
}