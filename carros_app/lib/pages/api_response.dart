import 'package:carrosapp/pages/login/usuario.dart';

class ApiResponse<T>{

  bool ok;
  String msg;
  T result;// objeto generico por exemplo retornar o usuario

  ApiResponse.ok({this.result, this.msg}){
    ok = true;
  } //construtor com nome
  ApiResponse.error({this.result,this.msg}){
    ok = false;
  } //construtor com nome
}