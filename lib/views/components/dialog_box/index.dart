import 'package:flutter/material.dart';

class DialogBox {
  void showOK(
    BuildContext context, {
    @required String titulo,
    @required String texto,
  }) {
    var btnOK = TextButton(
      child: Text(
        "OK",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(255, 255, 107, 107)),
        alignment: Alignment.center,
      ),
    );

    var alerta = AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.warning_rounded,
            color: Color.fromARGB(255, 255, 107, 107),
          ),
          SizedBox(width: 5),
          Text(titulo)
        ],
      ),
      content: Text(texto),
      actions: [
        btnOK,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void showDuasOp(
    BuildContext context, {
    @required String titulo,
    @required String texto,
    @required String txtBtn1,
    @required String txtBtn2,
    @required VoidCallback clickBtn1,
    @required VoidCallback clickBtn2,
  }) {
    var btn1 = TextButton(
      child: Text(
        txtBtn1,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        clickBtn1();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(255, 255, 107, 107)),
      ),
    );

    var btn2 = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          clickBtn2();
        },
        child: Text(txtBtn2));

    var alerta = AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: Color.fromARGB(255, 255, 107, 107),
          ),
          SizedBox(
            width: 5,
          ),
          Text(titulo)
        ],
      ),
      content: Text(texto),
      actions: [btn1, btn2],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
