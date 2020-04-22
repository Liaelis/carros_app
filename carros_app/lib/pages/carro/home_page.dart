import 'package:carrosapp/pages/carro/carro.dart';
import 'package:carrosapp/pages/carro/carros_api.dart';
import 'package:carrosapp/utils/prefs.dart';
import 'package:carrosapp/widgets/carros_listview.dart';
import 'package:carrosapp/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController; //utilizando no lugar do defaulttabcontroller
  // possibilita salvar indice da tap que o default nao suportava
  @override
  void initState() {
    super.initState();
    _initTabs();
  }
  _initTabs() async {

    // Primeiro busca o índice nas prefs.
    int tabIdx = await Prefs.geInt("tabIdx");

    // Depois cria o TabController
    // No método build na primeira vez ele poderá estar nulo
    _tabController = TabController(length: 3, vsync: this);

    // Agora que temos o TabController e o índice da tab,
    // chama o setState para redesenhar a tela
    setState(() {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        bottom: _tabController == null
        ? null
        :TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Classico",
            ),
            Tab(
              text: "Esportivo",
            ),
            Tab(
              text: "Luxo",
            ),
          ],
        ),
      ),
      body: _tabController == null
      ? Center(
        child: CircularProgressIndicator(),
      )
      : TabBarView(
        controller: _tabController,
        children: [
          CarrosListView(TipoCarro.classicos),
          CarrosListView(TipoCarro.esportivos),
          CarrosListView(TipoCarro.luxo),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}
// aparecer a foto e do lado nome
//return Row(
//children: <Widget>[
//Image.network(c.urlFoto, width: 150,),
//Flexible(
//child: Text(c.nome,
//maxLines: 1,//evita de quebrar linha
//overflow: TextOverflow.ellipsis,// quando texto não caber na tela fica 3 pontinhos
//style: TextStyle(
//fontSize: 25,
//),
//),
//),
//],
//);
// forma de trabalhar com retorno de Prefs pq é future
//Future<int> future = Prefs.geInt("tabIdx");
//pra ficar esperando usa metodo then
//future.then((int tabIdx) {
//_tabController.index = tabIdx;
//});