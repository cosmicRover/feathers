import 'package:feathers/login_flow/login_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final _viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
              // left: 70,
              // height: height/2,
              alignment: Alignment.topRight,
              child: Container(
                height: height/2,
                width: width/2,
                child: Image.asset(
                  'assets/login_assets/right_feather_shadow.png',
                  fit: BoxFit.fitWidth,
                ),
              )
              
              ),
          Align(
              // right: 200,
              // top: 300,

              // height: height/1.5,
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/login_assets/left_feather.png',
                  fit: BoxFit.fitWidth))
        ],
      ),
    );
  }
}

// FlatButton(
//   onPressed: () => _viewModel.initLoginFlow,
//   child: Text("Sign in with google logo", style: TextStyle(fontFamily: 'Gibson', fontSize: 30), ),
// )
