import 'package:tunicoapp/views/pages/barra_pesquisa/index.dart';
import 'package:tunicoapp/views/pages/criar_agenda/index.dart';
import 'package:tunicoapp/views/pages/criar_conta/index.dart';
import 'package:tunicoapp/views/pages/home/index.dart';
import 'package:tunicoapp/views/pages/perfil_usuario/index.dart';
import 'package:tunicoapp/views/pages/tela_inicial/index.dart';

abstract class AppRoutes{


  static const String CRIAR_CONTA ='CRIAR_CONTA';
  static const String HOME ='HOME';
  static const String PERFIL_USUARIO ='PERFIL_USUARIO';
  static const String TELA_INICIAL ='TELA_INICIAL';
  static const String BARRA_PESQUISA ='BARRA_PESQUISA';
  static const String CRIAR_AGENDA ='CRIAR_AGENDA';

  static final routes = {

    CRIAR_CONTA: (context) => CriarConta(),
    HOME: (context) => HomePage(),
    PERFIL_USUARIO: (context) => PerfilUsuario(),
    TELA_INICIAL: (context) => TelaInicial(),
    BARRA_PESQUISA: (context) => BarraPesquisa(),
    CRIAR_AGENDA: (context) => CriarAgendaPage(),
  };

}