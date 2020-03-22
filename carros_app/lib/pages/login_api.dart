import 'dart:convert';

import 'package:carrosapp/pages/api_response.dart';
import 'package:carrosapp/pages/usuario.dart';
import 'package:http/http.dart'
    as http; // as http é a variavel que tu vai usar pra chamar a lib

class LoginApi {
  // classe simples que vai encapsular a logica que vai chamar web service
// api response é tipado ai ele retorna um usuario dentro dele
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try{
      var url = 'http://carros-springboot.herokuapp.com/api/v2/login';
      //hashmap usado para encapusal os parametros do corpo do json
      Map<String,String> headers ={
        "Contente-Type":"application/json"
      };
      // utilizo as variaveis que chegaram por parametro
      Map params = {"username": login, "password": senha};

      String s = json.encode(params);
      var response = await http.post(url, body: s, headers:headers);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);
      if(response.statusCode==200){
        //fazer o parse do json direto na classe do objeto no construtor
        final user = Usuario(mapResponse);
        return ApiResponse.ok(user);
      }else{
        return ApiResponse.error(mapResponse["error"]);
      }

    }catch(error, exception){
      print("erro no login $error > $exception" );
      return ApiResponse.error("Não foi possivel fazer o login.");
    }
  }
}
