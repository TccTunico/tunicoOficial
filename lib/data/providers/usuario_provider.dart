import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioProvider{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //incluir
  Future<void> incluir(Map map, String uid) async{
    await _firestore.collection('usuarios').doc(uid).set(map);
  }
  //excluir
  Future<void> excluir(Map map) async {
    QuerySnapshot qs = await _firestore
      .collection('usuarios')
      .where('email', isEqualTo: map['email'])
      .get();

    await _firestore.collection('usuarios').doc(qs.docs.last.id).delete();
  }
  //selecionar
  Future<Map> selecionarPorId(String id) async {
    var qs = await _firestore
      .collection('usuarios')
      .doc(id)
      .get();

    return qs != null ? qs.data() : [];
  }
  //alterar
  Future<void> alterar(Map map) async {
    QuerySnapshot qs = await _firestore
      .collection('usuarios')
      .where('email', isEqualTo: map['email'])
      .get();

    await _firestore.collection('usuarios').doc(qs.docs.last.id).update(map);
  }

  Future<void> adicionarAgenda(String idUsuario, String idAgenda) async {
    await _firestore.collection('usuarios')
    .doc(idUsuario)
    .update({
      'agendas': FieldValue.arrayUnion([idAgenda])
    });
  }
}