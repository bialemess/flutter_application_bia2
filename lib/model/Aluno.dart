// ignore: camel_case_types
// ignore_for_file: unnecessary_this

class Aluno{
  int _senha;
  // ignore: unused_field
  String _nome;

  Aluno(this._senha, this._nome);

 
  get senha => this._senha;

  set senha(final value) => this._senha = value;


 
  get nome => this._nome;

  set nome(final value) => this._nome = value;



  
}