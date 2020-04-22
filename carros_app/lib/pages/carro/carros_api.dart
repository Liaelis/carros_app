import 'dart:convert' as convert;

import 'carro.dart';
import 'package:http/http.dart' as http;
class TipoCarro{
  static final String classicos = "classicos";
  static final String esportivos= "esportivos";
  static final String luxo = "luxo";
}
// Utilizando enum ao inves de classe String s = tipoCarro.toString().replaceAll("TipoCarro.", "");// isso pq no enum do dart nao da pra
//pegar só o name ai tem que tirar uma parte da string pra acessar a url
class CarrosAPI{
  static Future<List<Carro>> getCarros(String tipoCarro) async{

    var url = 'http://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipoCarro';
    var response = await http.get(url);
   String json = response.body;
    List mapResponse = convert.json.decode(json);
   final carros = mapResponse.map<Carro>((map) => Carro.fromJson(map)).toList();

    
    return carros;
  }
}
// outra forma de fazer parse
// final carros = List<Carro>();
//for(Map map in mapResponse){
//Carro c = Carro.fromJson(map);
//carros.add(c);
//}