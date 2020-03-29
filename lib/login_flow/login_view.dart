import 'package:feathers/login_flow/login_model.dart';
import 'package:flare_flutter/flare_actor.dart';
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
          Image.asset(
            "assets/login_assets/back.png",
            height: height,
            width: width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 22.0),
            child: Text(
              "Feathers,",
              style: TextStyle(
                  color: Color.fromRGBO(2, 13, 83, 1), fontSize: 28.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 22.0),
            child: Text(
              "Discover them all",
              style: TextStyle(
                  color: Color.fromRGBO(2, 13, 83, 1), fontSize: 28.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset("assets/login_assets/flower_gif.gif"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, right: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                "assets/login_assets/bird.gif",
                height: 300.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                child: flrButton(),
                onTap: () => _viewModel.initLoginFlow,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget flrButton() {
    return Container(
      height: 130.0,
      child: Stack(
        children: <Widget>[
          
          FlareActor(
            "assets/login_assets/play.flr",
            fit: BoxFit.contain,
            animation: "stand_by",
            color: Color.fromRGBO(18, 44, 147, 1),
          ),
          Center(child: Text("Begin", style: TextStyle(color: Colors.white),),),
        ],
      ),
    );
  }
}
