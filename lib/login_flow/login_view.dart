import 'package:feathers/login_flow/login_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final _viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF8F3F5),
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              

              //Placeholder(),
              Align(
                //alignment: Alignment.center,
                child: Image.asset("assets/login_assets/right_feather_shadow.png", alignment: Alignment.topRight,),
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          FlatButton(
            onPressed: () => _viewModel.initLoginFlow,
            child: Text("Sign in with google logo", style: TextStyle(fontFamily: 'Gibson', fontSize: 30), ),
          )
        ],
      ),
    );
  }
}
