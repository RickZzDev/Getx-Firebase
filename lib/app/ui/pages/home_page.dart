import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getXStudy/app/controllers/home_controller.dart';
import 'package:getXStudy/app/controllers/login_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_homeController.user.urlImage != null
                        ? _homeController.user.urlImage
                        : 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                  boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)],
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                '${_homeController.user.name}',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                '${_homeController.user.email}',
                style: TextStyle(
                  fontSize: 17.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30.0,
                    width: 95.0,
                    child: RaisedButton(
                      onPressed: () {
                        print("Idioma: Português");
                      },
                      child: Center(
                        child: Text(
                          'pt_BR',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30.0,
                    width: 95.0,
                    child: RaisedButton(
                      onPressed: () {
                        print("Idioma: Inglês");
                      },
                      child: Center(
                        child: Text(
                          'en_US',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30.0,
                    width: 130.0,
                    child: RaisedButton(
                      onPressed: () {
                        _homeController.changeTheme();
                      },
                      child: Center(
                        child: Text(
                          _homeController.txtThemeButton.value,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              Container(
                height: 30.0,
                width: 95.0,
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    LoginController().logOut();
                  },
                  child: Center(
                    child: Text(
                      'Sair',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
