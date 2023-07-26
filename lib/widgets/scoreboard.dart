import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';
import '../utils/config.dart';

class ScoreboardWidget extends StatelessWidget {
  final RxInt xScore;
  final RxInt yScore;
  const ScoreboardWidget({Key? key, required this.xScore, required this.yScore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Player 1  ',style: TextStyle(fontSize: 18,color: Colors.white),),
        Text(
          '$xScore',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 56,
              fontFamily: Constants.fontFamily,
              fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 4),
          child: const Text(
            ':',
            style: TextStyle(
                color: Constants.yellowColor,
                fontSize: 46,
                fontFamily: Constants.fontFamily,
                height: 1,
                fontWeight: FontWeight.w500),
          ),
        ),
        Text('Player 2  ',style: TextStyle(fontSize: 18,color: Colors.white),),
        Text(
          '$yScore',
          style: const TextStyle(
              color: Constants.accentColor,
              fontSize: 56,
              fontFamily: Constants.fontFamily,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
