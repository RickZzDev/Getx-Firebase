import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getXStudy/app/controllers/login_controller.dart';
import 'package:getXStudy/app/routes/app_routes.dart';
// import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
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
                height: 48,
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
                      _loginController.login();
                    }
                  },
                  color: Get.theme.primaryColor,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Acessar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Esqueceu a senha?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                },
                child: Text(
                  "Cadastrar-se",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
