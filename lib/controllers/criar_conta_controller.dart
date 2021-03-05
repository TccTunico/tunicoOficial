import 'package:flutter/cupertino.dart';
import 'package:tunico/data/models/usuario_model.dart';
import 'package:tunico/data/providers/cloud_firestore_provider.dart';
import 'package:tunico/data/repositories/usuario_repository.dart';
import 'package:tunico/routes/app_routes.dart';

class CriarContaController{
  final _usuarioRepository = UsuarioRepository();
  
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final fotoController = TextEditingController();

  void criarConta(BuildContext context) async {
    var usuario = new UsuarioModel(
      nome: nomeController.text, 
      email: emailController.text.trim(),
      foto: fotoController.text,
    );

    if (usuario.foto != null && !usuario.foto.contains('http')) {
      var cfsp = new CloudFireStoreProvider();
      usuario.foto = await cfsp.uploadUsuario(usuario.foto);
    }
    
    var retorno = await _usuarioRepository.incluir(usuario, senhaController.text.trim());

    if (retorno) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
    } else {
      print('Falha ao cadastrar o Usuario');
    }
  }
}