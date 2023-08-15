import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  String nome = "";
  int senha = 0;
  TextEditingController campoSenha = TextEditingController();
  TextEditingController campoNome = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    style: TextStyle(fontSize: 30 , color: Colors.deepPurple, fontWeight: FontWeight.bold ), 
                  
                  ),

      SizedBox(height: 12),
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

                  SizedBox(height: 10),

                  TextFormField(
                    controller: campoNome,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Preencher nome do usuário");
                      } else {
                        if (campoNome.text.length < 5) {
                          return ("o nome precisa ter mais que 5 carácteres");
                        }
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Nome do usuário",
                    ),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  mostrarMensagem();
                  senha = int.parse(campoSenha.text);
                  nome = campoNome.text;
                  setState(() {});

                  campoNome.clear();
                  campoSenha.clear();
                }
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white)
                    
                    ),
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 48, 223, 226)),
              child: const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  Text("Entrar"),
              ),
            )
          ])),
    );
  }

  void mostrarMensagem() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Usuário correto!')));
  }
}