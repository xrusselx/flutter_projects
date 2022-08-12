import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartHandler;

  String get resultPhrase {
    String resultText = "You did it!";
    if (resultScore == 30) {
      resultText = resultText + " You are Perfect!!!";
    } else if (resultScore >= 25) {
      resultText = resultText + " You are Spectacular!";
    } else if (resultScore >= 20) {
      resultText = resultText + " You are Amazing.";
    } else if (resultScore < 20) {
      resultText = resultText + " You are Nice.";
    }
    return resultText;
  }

  String resultaPhrase() {
    String resultText = "You did it!";
    if (resultScore == 30) {
      resultText = resultText + " You are Perfect!!!";
    } else if (resultScore >= 25) {
      resultText = resultText + " You are Spectacular!";
    } else if (resultScore >= 20) {
      resultText = resultText + " You are Amazing.";
    } else if (resultScore < 20) {
      resultText = resultText + " You are Nice.";
    }
    return resultText;
  }

  Result(this.resultScore, this.restartHandler);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultaPhrase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: restartHandler,
            child: Text("Restart Quiz!"),
            // textColor: Colors.blue,
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
