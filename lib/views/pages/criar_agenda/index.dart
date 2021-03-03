import 'package:flutter/material.dart';
import 'package:tunicoapp/views/components/flat_button_ext/index.dart';
import 'package:tunicoapp/views/components/text_form_field_ext/index.dart';
import 'package:tunicoapp/views/components/flat_button_ext/index.dart';
import 'package:tunicoapp/views/components/text_form_field_ext/index.dart';

class CriarAgendaPage extends StatefulWidget {
  @override
  _CriarAgendaPageState createState() => _CriarAgendaPageState();
}

class _CriarAgendaPageState extends State<CriarAgendaPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color:Color.fromRGBO(255, 107,107, 1)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: 
      Text('Criar Agenda', style: TextStyle(color: Color.fromRGBO(255, 107,107, 1)),), 
        
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 100,
                  child: Image.asset('assets/images/grupo_pessoas.png'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                  child: TextFormFieldExt(
                      labelText: 'Nome da agenda',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.edit),
                      //controller: ,
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
                      prefixIcon: Icon(Icons.description_outlined),
                      //controller: ,
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
                    prefixIcon: Icon(Icons.vpn_key),
                    obscureText: true,
                    //controller: ,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextFormFieldExt(
                    labelText: 'N° de participantes (máx XX)',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(Icons.people_alt_outlined),
                    obscureText: true,
                    //controller: ,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                  child: FlatButtonExt(
                    text: 'Criar nova agenda',
                    onPressed: () {
                      if (!_formKey.currentState.validate()) return;
                      // colocar controller aqui
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}