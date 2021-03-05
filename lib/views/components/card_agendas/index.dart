import 'package:flutter/material.dart';
import 'package:tunico/data/models/agenda_model.dart';

class CardAgenda extends StatelessWidget{
  String nome;
  String descricao;
  String uid;
  Function(String uid) onDelete;
  Function onRefresh;
  String urlImage;
  Image image;

  CardAgenda({
    this.image,
    this.nome,
    this.descricao,
    this.urlImage,
    this.uid,
    this.onDelete,
    this.onRefresh
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: InkWell(
        onTap: () async {
          var item = new AgendaModel(
            id: this.uid,
            nome: this.nome,
            descricao: this.descricao,
            foto: this.urlImage,
          );

          // await Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => new ItemPage(
          //           dadosIniciais: item,
          //         )));
          // onRefresh();
        },
        child: Dismissible(
          key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
          background: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment(0.9, 0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onDelete(this.uid);
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  child: this.image,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          this.nome,
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          this.descricao,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}