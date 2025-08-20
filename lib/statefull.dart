import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  late TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer();
     
  }

  @override
  void dispose() {
    _tapRecognizer.dispose(); // gesture recognizer ko free karna zaroori hai
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // 👈 Zaroori: context yahan se lena hai
        appBar: AppBar(title: Text('Stateful RichText Snackbar')),
        body: Center(
          child: RichText(
            text: TextSpan(
              text: 'Click ',
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: [
                TextSpan(
                  text: 'here',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Link clicked!')),
                      );
                    },
                ),
                TextSpan(
                  text: ' to show a snackbar.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
