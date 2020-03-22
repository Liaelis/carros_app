class Usuario{
  String login;
  String nome;
  String email;
  String token;
  List<String> roles;

  //fazer o parse direto na classe
  Usuario(Map<String,dynamic>map):
  this.nome = map["nome"],
  this.login=map["login"],
  this.token=map["token"],
  this.email = map["email"],
  this.roles = getRoles(map);
 // map["roles"] != null // if ternario
  //? map["roles"].map<String>((role) => role.toString()).toList
    //  : null;
//chamando um metodo para converter o map para string
static List<String>getRoles(Map<String,dynamic> map){
   List listaAuxiliar = map["roles"];
    List<String> roles =[];
   for(String role in listaAuxiliar) {
      roles.add(role);
   }
   return roles;
  }

  //outra forma de fazer
//  static List<String>getRoles(Map<String,dynamic> map){
//    map["roles"].map<String>((role) => role.toString()).toList; essa função vai percorrer e pegar
// pode se utilizar a linha acima direto no construtor
//
//  }
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }


}