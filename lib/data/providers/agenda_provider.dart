import 'package:cloud_firestore/cloud_firestore.dart';

class AgendaProvider{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Incluir
  Future<String> incluir(Map map) async {
    String id;
    await _firestore.collection('agendas').add(map).then((docRef) => {
      id = docRef.id
    });
    return id;
  }

  //Excluir
  Future<void> excluir(String uid) async {
    await _firestore.collection('agendas').doc(uid).delete();
  }

  //Selecionar
  Future<List<Map>> selecionarTodos({List agendas}) async {
    var lista = new List<Map>();

    if (agendas != null){
      for (int j = 0; j < agendas.length; j++) {
        var qs = await _firestore.collection('agendas').doc(agendas[j]).get();
        lista.add(qs.data());
      }
    }
    else{
      var qs = await _firestore.collection('agendas').get();
      for (int i = 0; i < qs.docs.length; i++) {
        var item = qs.docs[i].data();
        item['id'] = qs.docs[i].id;
        lista.add(item);
      }
    }
    // var qs = await _firestore.collection('agendas').where('participantes', arrayContains: uid).get();

    // var lista = new List<Map>();

    // for (int i = 0; i < qs.docs.length; i++) {
    //   print(qs.docs[i]);
    //   var item = qs.docs[i].data();
    //   item['id'] = qs.docs[i].id;
    //   lista.add(item);
    // }

    return lista;
  }

  //Alterar
  Future<void> alterar(Map map) async {
    await _firestore.collection('agendas').doc(map['id']).update(map);
  }
}