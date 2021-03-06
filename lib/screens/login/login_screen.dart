import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo/blocs/login/field_state.dart';
import 'package:xlo/blocs/login/login_bloc.dart';
import 'package:xlo/screens/login/widgets/facebook_button.dart';
import 'package:xlo/screens/login/widgets/login_button.dart';
import 'package:xlo/screens/login/widgets/or_divider.dart';
import 'package:xlo/screens/singup/singup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginBloc _loginBloc = LoginBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('Entrar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FacebookButton(_loginBloc),
              OrDivider(),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 11),
                child: Text(
                  'Entre com E-mail:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, bottom: 4),
                child: Text(
                  'E-mail',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              StreamBuilder<FieldState>(
                stream: _loginBloc.outEmail,
                initialData: FieldState(),
                builder: (context, snapshot) {
                  return TextField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: snapshot.data.error,
                    ),
                    onChanged: _loginBloc.changeEmail,
                    enabled: snapshot.data.enable,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, bottom: 4, top: 26),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Senha',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.deepPurple
                        ),
                      ),
                      onTap: () {
                        //Navigator.off(context).push(MaterialPageRoute(
                        // builder: (context) => RecoveryScreen()));
                      },
                    )
                  ],
                ),
              ),
              StreamBuilder<FieldState>(
                stream: _loginBloc.outPassword,
                initialData: FieldState(),
                builder: (context, snapshot) {
                  return TextField(
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: snapshot.data.error,
                    ),
                    onChanged: _loginBloc.changePassword,
                    enabled: snapshot.data.enable,
                  );
                },
              ),
              LoginButton(_loginBloc),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Não Tem Conta?',
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  SignUpScreen()));
                      },
                      child: Text(
                        '  Cadastrar-se',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.deepPurple,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}