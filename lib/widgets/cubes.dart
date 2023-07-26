import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../constants/constant.dart';
import '../controllers/tic_tac_toe.dart';
import '../utils/config.dart';
import '../utils/util.dart';

class CubesWidget extends StatelessWidget {
  final String displayElement;
  final int i, j;
  final TicTacToeController ticTacToeController =
      Get.put(TicTacToeController());
  CubesWidget(
      {Key? key,
      required this.displayElement,
      required this.i,
      required this.j})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<TicTacToeController>(builder: (_) {
      return IgnorePointer(
        ignoring: ticTacToeController.stopInteraction.value,
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 26,
          height: SizeConfig.safeBlockVertical * 12,
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade300,
              border: Util.getBorderSide(i, j)),
          child: Center(
              child: Text(
            displayElement,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 80,
                color: displayElement == 'X'
                    ? Colors.white
                    : Constants.accentColor),
          )),
        ),
      );
    });
  }
}
