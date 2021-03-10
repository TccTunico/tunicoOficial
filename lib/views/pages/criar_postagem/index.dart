import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tunico2/views/components/flat_button_ext/index.dart';

class CriarPost extends StatefulWidget {
  @override
  _CriarPostState createState() => _CriarPostState();
}

class _CriarPostState extends State<CriarPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Fazer publicação',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: TextField(
              maxLength: 250,
              maxLines: 7,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
            child: FlatButtonExt(
              text: 'Enviar',
              onPressed: () {
                final snackBar = SnackBar(
                  duration: const Duration(seconds: 3), //tempo na tela
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  )),
                  backgroundColor: Colors.blueAccent,
                  content: Text('Novo dialogo com usuário'),
                  action: SnackBarAction(
                    label: 'Entendi',
                    textColor: Color.fromARGB(255, 255, 148, 88),
                    onPressed: () {
                      // Algum código para fazer alguma coisa
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),
        ],
      ),
    );
  }
}
