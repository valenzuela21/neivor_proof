import 'package:flutter/material.dart';
class GeneralLayout extends StatelessWidget {

  Widget child;

  GeneralLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset("assets/images/neivor.png", width: 120,),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            child: child,
          ),
        ),
      ),
    );
  }
}
