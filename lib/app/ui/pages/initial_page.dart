import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:getXStudy/app/routes/app_routes.dart';

// import 'package:http/http.dart' as http;

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashScreen(
            seconds: 5,
            navigateAfterSeconds: Routes.LOGIN,
            loaderColor: Colors.transparent,
            imageBackground: AssetImage('assets/uchiha.jpg'),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [
                  Colors.purple.withOpacity(0.8),
                  Colors.purple[900].withOpacity(0.8)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
