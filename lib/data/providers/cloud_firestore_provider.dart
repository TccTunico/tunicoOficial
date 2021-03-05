import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CloudFireStoreProvider{
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadUsuario(String caminho) async{
    var nome = caminho.split('/')[caminho.split('/').length - 1];
    var storageReference = firebaseStorage.ref().child('usuarios/$nome');
    var imagem = File(caminho);

    UploadTask task = storageReference.putFile(imagem);
    await task;
    var urlFoto = await storageReference.getDownloadURL();

    return urlFoto;
  }

  Future<String> uploadAgenda(String caminho) async{
    var nome = caminho.split('/')[caminho.split('/').length - 1];
    var storageReference = firebaseStorage.ref().child('agendas/$nome');
    var imagem = File(caminho);

    UploadTask task = storageReference.putFile(imagem);
    await task;
    var urlFoto = await storageReference.getDownloadURL();

    return urlFoto;
  }
}