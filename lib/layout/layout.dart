import 'package:flutter/material.dart';

import '../utils/config.dart';


class CustomLayout extends StatelessWidget {
  final Widget child;

  const CustomLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text("TIC TAC TOE",style: TextStyle(fontSize: 28),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blueGrey,
          child: Column(
            children: [
             // const AppBarWidget(),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
