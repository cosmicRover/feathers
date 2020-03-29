import 'package:feathers/login_flow/login_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final _viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Placeholder(),
              Align(
                alignment: Alignment.center,
                child: Text("graphics goes here"),
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          FlatButton(
            onPressed: () => _viewModel.initLoginFlow,
            child: Text("Sign in with google logo"),
          )
        ],
      ),
    );
  }
}
