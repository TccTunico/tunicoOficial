import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tunico/controllers/criar_agenda_controller.dart';
import 'package:tunico/views/components/FlatButtonExt/index.dart';
import 'package:tunico/views/components/TextFormFieldExt/index.dart';

class CriarAgendaPage extends StatefulWidget {
  @override
  _CriarAgendaPageState createState() => _CriarAgendaPageState();
}

class _CriarAgendaPageState extends State<CriarAgendaPage> {
  final _formKey = GlobalKey<FormState>();
  final imagePicker = ImagePicker();
  final _controller = CriarAgendaController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromRGBO(255, 107, 107, 1)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Criar Agenda',
          style: TextStyle(color: Color.fromRGBO(255, 107, 107, 1)),
        ),
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
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
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: _retornaFoto(_controller.fotoController.text),
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
                                  _controller.fotoController.text = fotoSelecionada.path;
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
                  padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                  child: TextFormFieldExt(
                      labelText: 'Nome da agenda',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.edit,
                          color: Color.fromRGBO(255, 148, 88, 1)),
                      controller: _controller.nomeController,
                      validator: (text) {
                        if (text.trim().length == 0)
                          return 'Nome não informado';
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextFormFieldExt(
                      labelText: 'Descrição',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.description,
                          color: Color.fromRGBO(255, 148, 88, 1)),
                      controller: _controller.descricaoController,
                      validator: (text) {
                        if (text.trim().length == 0)
                          return 'Descrição não informada';
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextFormFieldExt(
                    labelText: 'Senha (opcional)',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(Icons.vpn_key,
                        color: Color.fromRGBO(255, 148, 88, 1)),
                    obscureText: true,
                    controller: _controller.senhaController,
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                //   child: TextFormFieldExt(
                //     labelText: 'N° de participantes (máx XX)',
                //     keyboardType: TextInputType.number,
                //     prefixIcon: Icon(Icons.people,
                //         color: Color.fromRGBO(255, 148, 88, 1)),
                //     obscureText: true,
                //     //controller: ,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                  child: FlatButtonExt(
                    text: 'Criar nova agenda',
                    onPressed: () {
                      if (!_formKey.currentState.validate()) return;
                      _controller.criarAgenda(context);
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }

  dynamic _retornaFoto(String caminho) {
    if (caminho.length == 0) {
      return AssetImage('assets/images/avatar_grupo.png');
    } else {
      if (caminho.contains('http'))
        try {
          return NetworkImage(caminho);
        } catch (ex) {
          return AssetImage('assets/images/avatar_grupo.png');
        }
      else
        try {
          return FileImage(File(caminho));
        } catch (ex) {
          return AssetImage('assets/images/avatar_grupo.png');
        }
    }
  }
}
