import 'package:flutter/material.dart';
class GeneralLayout extends StatelessWidget {

  final Widget child;

  const GeneralLayout({Key? key, required this.child}) : super(key: key);

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
          child: SizedBox(
            width: 400,
            child: child,
          ),
        ),
      ),
    );
  }
}
