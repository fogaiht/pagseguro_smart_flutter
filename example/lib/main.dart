import 'package:flutter/material.dart';
import 'package:pagseguro_smart_flutter/pagseguro_smart_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var message = "";
  Payment payment;

  @override
  void initState() {
    payment = Payment(onMessage: (value) {
      setState(() {
        message = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            children: <Widget>[
              Text("STATUS"),
              Text(message),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  onPressed: () async {
                    final value = await payment.debitPayment(100);
                    print(value);
                  },
                  child: Text("DebitPayment 1.00")),
              FlatButton(
                  onPressed: () async {
                    final value = await payment.creditPayment(100);
                    print(value);
                  },
                  child: Text("CreditPayment 1.00")),
              FlatButton(
                  onPressed: () async {
                    final value = await payment.abortTransaction();
                    print(value);
                  },
                  child: Text("AbortPayment 1.00")),
            ],
          )),
    );
  }
}
