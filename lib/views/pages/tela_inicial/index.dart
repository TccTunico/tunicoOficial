import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tunicoapp/routes/app_routes.dart';
import 'package:tunicoapp/views/components/flat_button_ext/index.dart';
import 'package:tunicoapp/views/components/text_form_field_ext/index.dart';


class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final _formKey = GlobalKey<FormState>();
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: 
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              
              padding: EdgeInsets.all(0),
              
                child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Center(child: Text('tUni.co',
                     style: TextStyle(fontSize: 20, color: Colors.grey[800], fontWeight: FontWeight.bold),))
                  ),
                  Container(
                    height: 163,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 100,
                        child: Image.asset('assets/images/logo_final_rosa.png'),
                      ),
                    ),
                  ),
                  
                  
                   Padding(
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 0),
                    child: Center(child: Text('BEM-VINDO(A)!',
                     style: TextStyle(fontSize: 23, color: Colors.grey[800], fontWeight: FontWeight.bold, fontFamily: 'Nunito' ),))
                  ),
                  Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email, color: Color.fromRGBO(255, 148, 88, 1),),
                  
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: TextFormFieldExt(
                    labelText: 'Senha',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(Icons.vpn_key, color: Color.fromRGBO(255, 148, 88, 1),),
                    obscureText: true,
                    
              )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
                    child: FlatButtonExt(
                      text: 'Entrar',
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.HOME);
                      },
                    ),
                  ),
                  
                SizedBox(height: 6,),
                  Center(child: InkWell(child: Text('Esqueci a minha senha'),
                   onTap:(){
                    
                   })),

                 SizedBox(height: 10,),

                  Center(child: InkWell(
                    child: 
                    Text('Ainda não tem uma conta? Cadastre-se!' ,style: TextStyle(color: Color.fromRGBO(255, 148, 88, 1)),),
                   onTap:(){
                    Navigator.of(context).pushNamed(AppRoutes.CRIAR_CONTA);
                   })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}