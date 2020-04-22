import 'package:carrosapp/utils/prefs.dart';
import 'dart:convert' as convert;

class Usuario{
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  Usuario({
    this.login,
    this.nome,
    this.email,
    this.urlFoto,
    this.token,
    this.roles
});

Usuario.fromJson(Map<String, dynamic> json){
  login = json['login'];
  nome= json['nome'];
  email = json['email'];
  urlFoto = json['urlFoto'];
  token = json['token'];
  roles = json['roles'] != null ? json['roles'].cast<String>() : null;
}
Map<String, dynamic> toJson(){
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['login']=this.login;
  data['nome']=this.nome;
  data['email']=this.email;
  data['urlFoto']= this.urlFoto;
  data['token'] = this.token;
  data['roles']=this.roles;
  return data;
}
  static void clear() {
    Prefs.setString("user.prefs", "");
  }
// salva usuario na cache
  void save() {
  Map map = toJson();
  String json = convert.json.encode(map);
  Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
  String json = await Prefs.getString("user.prefs");

  if(json.isEmpty){
    return null;
  }
  Map map = convert.json.decode(json);
  Usuario user = Usuario.fromJson(map);
  return user;

  }

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, urlFoto: $urlFoto, token: $token, roles: $roles}';
  }


//outra forma de fazer
//  static List<String>getRoles(Map<String,dynamic> map){
//    map["roles"].map<String>((role) => role.toString()).toList; essa função vai percorrer e pegar
// pode se utilizar a linha acima direto no construtor
//
//  }



}