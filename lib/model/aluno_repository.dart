

import 'Aluno.dart';

class AlunoRepository{

List<Aluno> _listaAlunos = [];


void adicionarAluno(Aluno aluno){

 _listaAlunos.add(aluno);
}

  bool login(Aluno aluno)  {

  for (var u in _listaAlunos){
    if (u.nome == aluno.nome && u.senha == aluno.senha)
    return true;
  }
    
  return false;
  }


void imprimirAlunos()

{

  for (var i=0; i<_listaAlunos.length; i++) 
  
  {

    print("Aluno: ${_listaAlunos[i].nome} , Senha: ${_listaAlunos[i].senha}");
  }
 

}

}