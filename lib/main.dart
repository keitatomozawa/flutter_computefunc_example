import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'compute func example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'compute func example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'the 20000-th prime is...',
            ),
            Text(
              _result,
              style: Theme.of(context).textTheme.display1,
            ),

            CircularProgressIndicator(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: _badCalc(20000),
                  child: Text("Bad Example"),
                ),
                RaisedButton(
                  onPressed: _goodCalc(20000),
                  child: Text("Good Example"),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

  _badCalc(int num) {
    setState(() {
      _result = "calculating...";
    });
    int answer = _calcNthPrime(num);

    setState(() {
      _result = '$answer';
    });
  }

  _goodCalc(int num) {
    setState(() {
      _result = "calculating...";
    });
    compute(_calcNthPrime, num).then((answer) {
      setState(() {
        _result = '$answer';
      });
    });

  }

  static int _calcNthPrime(int num) {
    int cnt = 0;
    int target = 1;
    while(cnt<num) {
      target++;
      if(_isPrime(target)){
        cnt++;
      }
    }
    return target;
  }

  static bool _isPrime(int num) {
    int divisor = 2;
    while(divisor<num){
      if(num%divisor==0) {
        return false;
      }
      divisor++;
    }
    return true;
  }
}

