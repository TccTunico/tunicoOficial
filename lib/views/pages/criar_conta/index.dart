import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tunicoapp/routes/app_routes.dart';
import 'package:tunicoapp/views/components/flat_button_ext/index.dart';
import 'package:tunicoapp/views/components/text_form_field_ext/index.dart';

class CriarConta extends StatefulWidget {
  @override
  _CriarContaState createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {

  final _formKey = GlobalKey<FormState>();
  final imagePicker = ImagePicker();
  String foto= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color:Color.fromRGBO(255, 107,107, 1)),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        title: 
      Text('Criar Conta', style: TextStyle(color: Colors.grey[800]),), 
        
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(image: _retornaFoto(foto), 
                                ),
                          )),
                    ),
                    Center(
                      child: Container(
                        color: Colors.transparent,
                        width: 250,
                        height: 190,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton<int>(
                            itemBuilder: (context) => <PopupMenuEntry<int>>[
                              const PopupMenuItem<int>(
                                child: Text('Câmera'),
                                value: 0,
                              ),
                              const PopupMenuItem<int>(
                                child: Text('Galeria'),
                                value: 1,
                              )
                            ],
                            onSelected: (valor) async {
                              final fotoSelecionada =
                                  await imagePicker.getImage(
                                      source: (valor == 0
                                          ? ImageSource.camera
                                          : ImageSource.gallery));
                              setState(() {
                               foto = fotoSelecionada.path;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Nome',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(Icons.edit, color:Color.fromRGBO(255, 148, 88, 1),),
                 
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email, color: Color.fromRGBO(255, 148, 88, 1),),
                  
                ),
              ),
               Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Senha',
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  prefixIcon: Icon(Icons.vpn_key, color: Color.fromRGBO(255, 148, 88, 1),),
                  
                ),
              ),
              
              Padding(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
                child: FlatButtonExt(
                  text: 'Cadastrar',
                  onPressed: () {
                   Navigator.of(context).pushNamed(AppRoutes.TELA_INICIAL);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

 dynamic _retornaFoto(String caminho) {
    if (caminho.length == 0) {
      return AssetImage('assets/images/cadastro_reduzido_laranja.png');
    } else {
      if (caminho.contains('http'))
        try {
          return NetworkImage(caminho);
        } catch (ex) {
          return AssetImage('assets/images/cadastro_reduzido_laranja.png');
        }
      else
        try {
          return FileImage(File(caminho));
        } catch (ex) {
          return AssetImage('assets/images/cadastro_reduzido_laranja.png');
        }
    }
  }
}