import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/constant.dart';
import '../utils/util.dart';
import '../widgets/button.dart';

class TicTacToeController extends GetxController {
  final RxString currentDisplayElement = 'X'.obs;
  final RxList<List<String>> data = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ].obs;
  final RxInt xScore = 0.obs;
  final RxInt yScore = 0.obs;
  dynamic oldScore;
  final RxInt xOld = 0.obs;
  final RxInt yOld = 0.obs;
  final RxBool stopInteraction = false.obs;

  // functions
  // Open dialog if anyone won game
  void openGetXDialog(String displayElement) {
    Get.defaultDialog(
        title: displayElement == 'draw'
            ? "''DRAW''"
            : "''$displayElement'' won !!",
        middleText: "Reset game to play again",
        backgroundColor: Colors.blue,
        titleStyle: const TextStyle(
            color: Colors.white,
            fontFamily: Constants.fontFamily,
            fontWeight: FontWeight.w600),
        middleTextStyle: const TextStyle(
            color: Colors.white, fontFamily: Constants.fontFamily),
        confirm: ButtonWidget(
            width: 140,
            height: 40,
            onPressed: () {
              GetStorage().write(Constants.storageKey, [xScore.value,yScore.value]);
              onResetClick();
              Get.back(closeOverlays: true);
            },
            text: 'play again'),
        barrierDismissible: false,
        radius: 8);
  }


  void onUserClick(int i, int j) {
    if (data[i][j] != '') return;
    data[i][j] = currentDisplayElement.value;
    if (currentDisplayElement.value == 'X') {
      currentDisplayElement.value = 'O';
    } else {
      currentDisplayElement.value = 'X';
    }
    String winner = Util.calculateWinner(data);
    if (winner == 'X') {
      xScore.value = xScore.value + 1;
      stopInteraction.value = true;
      openGetXDialog(winner);
    } else if (winner == 'O') {
      yScore.value = yScore.value + 1;
      stopInteraction.value = true;
      openGetXDialog(winner);
    } else if (winner == 'draw') {
      openGetXDialog(winner);
    }
    update();
  }

  void onNewGameClick() {
    data.value = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ];
    xScore.value = 0;
    yScore.value = 0;
    currentDisplayElement.value = 'X';
    stopInteraction.value = false;
    update();
  }

  void onResetClick() {
    data.value = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ];
    currentDisplayElement.value = 'X';
    stopInteraction.value = false;
    // GetStorage().erase();
    xOld.value = 0;
    yOld.value = 0;
    update();
  }
  @override
  void onInit() {
    oldScore = GetStorage().read(Constants.storageKey);
    if(oldScore != null){
      xOld.value = oldScore[0];
      yOld.value = oldScore[1];
    }
    super.onInit();
  }
}
