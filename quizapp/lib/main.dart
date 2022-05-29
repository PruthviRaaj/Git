// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizapp/data/question_list.dart';
import 'package:quizapp/screens/results.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color.fromARGB(255, 28, 195, 187);
  Color secondColor = Color.fromARGB(255, 239, 80, 181);

  PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isRight = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color.fromARGB(255, 239, 80, 181);
  int score = 0;

  get mainAxisAlignment => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.00),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question ${index + 1}/${questions.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  questions[index].question!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 18.0),
                    child: MaterialButton(
                      // shape: StadiumBorder(),
                      color: isPressed
                          ? questions[index].answers!.entries.toList()[i].value
                              ? isRight
                              : isWrong
                          : secondColor,
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answers!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 1;
                                print(score);
                              }
                            },
                      child: Text(
                        questions[index].answers!.keys.toList()[i],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 30.0,
                ),
                OutlineButton(
                  onPressed: isPressed
                      ? index + 1 == questions.length
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultScreen(score)));
                            }
                          : () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.linear);
                            }
                      : null,
                  child: Text(
                    index + 1 == questions.length
                        ? "See SCORE"
                        : "NEXT Question",
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
