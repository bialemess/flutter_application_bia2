import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_bia2/model/aluno_repository.dart';

import 'model/Aluno.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

//add

class _MyCadastroState extends State<MyCadastro> {
  AlunoRepository alRepo = AlunoRepository();

  String nome = "";
  int senha = 0;
  TextEditingController campoSenha = TextEditingController();
  TextEditingController campoNome = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://img.freepik.com/vetores-gratis/ilustracao-do-conceito-de-login-movel_114360-135.jpg?w=2000',
                      width: 150,
                    ),

                    const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 12),
                    const Divider(
                      height: 5,
                      thickness: 2,
                      endIndent: 10,
                    ),
                    //

                    TextFormField(
                      controller: campoSenha,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("a Senha não pode ser vazia");
                        } else if (int.parse(campoSenha.text) < 10) {
                          //else if(campoRa.text.length<10){

                          return ("a Senha deve ser pelo menos 3 carácteres");
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        //dentro de 1 parenteses é só vírgula

                        labelText: "Senha",
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: campoNome,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Preencher nome do usuário");
                        } else {
                          if (campoNome.text.length < 3) {
                            return ("o nome precisa ter mais que 3 carácteres");
                          }
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Nome do usuário",
                      ),
                    ),

                    ElevatedButton(
                      child: Text("Entrar"),
                      onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final aluno =
                            Aluno(int.parse(campoSenha.text), campoNome.text);
                        if (alRepo.login(aluno)) {
                          setState(() {
                            campoNome.clear();
                            campoSenha.clear();
                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  // <-- SEE HERE
                                  title: const Text('Aluno Existe'),
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Ok'),
                                    ),
                                   
                                   
                                  ],
                                );
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  // <-- SEE HERE
                                  title: const Text('Aluno Não Existe'),
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Ok'),
                                    ),
                                   
                                  ],
                                );
                              });
                        }
                      }
                        
                    }),

                    ElevatedButton(
                      onPressed: () {
                        Aluno a =
                            Aluno(int.parse(campoSenha.text), campoNome.text);
                        alRepo.adicionarAluno(a);
                        alRepo.imprimirAlunos();
                      },
                      child: Text("Cadastrar"),
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
