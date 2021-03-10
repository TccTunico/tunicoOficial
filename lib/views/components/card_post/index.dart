import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  String uid;
  Image foto;
  String autor;
  String texto;

  CardPost({
    this.uid,
    this.foto,
    this.autor,
    this.texto,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: InkWell(
        child: Dismissible(
          key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
          background: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment(0.9, 0),
              child: Icon(
                Icons.report_outlined,
                color: Colors.white,
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            //ação a se adicionar quando deslizar o card
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 25,
                        child: this.foto,
                      ),
                    ),
                    Text(
                      this.autor,
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              this.texto,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
