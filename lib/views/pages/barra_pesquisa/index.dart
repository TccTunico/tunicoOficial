import 'package:flutter/material.dart';
class BarraPesquisa extends StatefulWidget {
  @override
  _BarraPesquisaState createState() => _BarraPesquisaState();
}

class _BarraPesquisaState extends State<BarraPesquisa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BARRA DE PESQUISA')),
    );
  }
}