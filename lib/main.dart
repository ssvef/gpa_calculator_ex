import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Grade Point Average Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Grades instruccions: >=0 and <2,9: R, >3 and <=5 :A
   final gradeone= TextEditingController();
   final gradetwo= TextEditingController();
   final gradethree= TextEditingController();
   final gradefour= TextEditingController();
   double _calculate=0;
   String _msg="";

  void _calculateavg() {
    setState(() {
      _calculate = (double.parse(gradeone.text) + double.parse(gradetwo.text) +
          double.parse(gradethree.text) + double.parse(gradefour.text)) / 4;

      if(_calculate >=0 && _calculate <2.9){
      _msg="Your grade point average is: ${_calculate.toStringAsFixed(2)} You Reproved.";
      }else if(_calculate >3 && _calculate <5){
        _msg="Your grade point average is: ${_calculate.toStringAsFixed(2)} You approved.";}
      else {
        _msg="The values entered are incorrect. Keep in mind that you must enter grades between 0 and 5 points.";}
    });//SetState
     }//Function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Center(
          child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              'Please enter the grades to calculate the total average',
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: gradeone,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Here the first grade. (Optional)",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: gradetwo,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Here the second grade. (Optional)",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: gradethree,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Here the third grade. (Optional)",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: gradefour,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Here the fourth grade. (Optional)",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () {  _calculateavg();},
              child: const Text('Calculate'),
            ),
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: SizedBox(
                width: 300,
                height: 80,
                child: Center(
                  child: Text(_msg),
              ),
            ),
        ),
    ],
      ),
      ),
    ),
    );
  }
}
