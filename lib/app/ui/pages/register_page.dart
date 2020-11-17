import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getXStudy/app/controllers/login_controller.dart';
// import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  final LoginController _loginController = LoginController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('assets/uchiha.jpg'),
                  radius: 48,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Center(
                child: Text(
                  "CADASTRAR",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              TextFormField(
                controller: _loginController.nameTextController,
                validator: (value) {
                  value.isEmpty ? "Campo obrigatorio" : null;
                },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                cursorColor: Get.theme.accentColor,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Digite seu nome",
                  labelStyle: TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _loginController.emailTextController,
                validator: (value) {
                  if (value.isEmpty)
                    "Campo obrigatorio";
                  else if (!GetUtils.isEmail(value)) {
                    return "Email inválido";
                  }

                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                cursorColor: Get.theme.accentColor,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Digite seu email",
                  labelStyle: TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _loginController.passwordTextController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo obrigatório";
                  } else if (value.length < 6) {
                    return "Senha deve ser maior que 6";
                  }
                  return null;
                },
                autofocus: false,
                obscureText: true,
                cursorColor: Get.theme.accentColor,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Digite sua senha",
                  labelStyle: TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _loginController.register();
                    }
                  },
                  color: Get.theme.primaryColor,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Voltar para login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
