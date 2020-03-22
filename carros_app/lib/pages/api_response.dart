class ApiResponse<T>{

  bool ok;
  String msg;
  T result;// objeto generico por exemplo retornar o usuario

  ApiResponse.ok(this.result){
    ok = true;
  } //construtor com nome
  ApiResponse.error(this.msg){
    ok = false;
  } //construtor com nome
}