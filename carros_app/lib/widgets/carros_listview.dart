

import 'package:carrosapp/pages/carro/carro.dart';
import 'package:carrosapp/pages/carro/carros_api.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatefulWidget {
  String tipo;

  CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView> with AutomaticKeepAliveClientMixin<CarrosListView>{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  _body() {
    Future<List<Carro>> futureCarros = CarrosAPI.getCarros(widget.tipo);
    return FutureBuilder(
      future: futureCarros,
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(
            child: Text(
              "Não foi possivel buscar os carros",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;
        return _listView(carros);
      },
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
      // pra descolar o card da borda
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return Card(
            color: Colors.grey[100],
            child: Container(
              // envolver com container pra descolar as coisas da borda
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // puxar elementos pra esquerda
                children: <Widget>[
                  Center(
                      child: Image.network(
                        c.urlFoto, // ?? "url fixa" é tipo um if ternario pra quando foto tiver nula
                        width: 250,
                      )),
                  // deixar só imagem no centro
                  Text(
                    c.nome,
                    maxLines: 1,
                    //evita de quebrar linha
                    overflow: TextOverflow.ellipsis,
                    // quando texto não caber na tela fica 3 pontinhos
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "descrição . . .",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
