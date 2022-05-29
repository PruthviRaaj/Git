import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color.fromARGB(255, 28, 195, 187);
    Color secondColor = Color.fromARGB(255, 239, 80, 181);
    return Scaffold(
      backgroundColor: secondColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "QUIZ FINISHED",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "\nYoUr ScOrE iS: ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 50.00),
            Text(
              "${widget.score}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 100.00,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
