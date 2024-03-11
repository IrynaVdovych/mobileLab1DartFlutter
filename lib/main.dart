import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '~Laboratory work #1',
      home: IncrementScreen(),
    );
  }
}

class IncrementScreen extends StatefulWidget {
  @override
  _IncrementScreenState createState() => _IncrementScreenState();
}

class _IncrementScreenState extends State<IncrementScreen> {
  int _counter = 0;
  TextEditingController _textEditingController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incrementing'),
        backgroundColor: Colors.pink, // зміна кольору панелі
      ),
      backgroundColor: Colors.white, // зміна кольору фону вікна
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              onChanged: (value) {
                setState(() {
                  if (value.toLowerCase() == "avada kedavra") {
                    _errorMessage = '';
                  } else if (isNumeric(value)) {
                    _errorMessage = '';
                  } else {
                    _errorMessage = 'Error: Only numbers are accepted';
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter text',
                hintText: 'Enter a number or "Avada Kedavra"',
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            String text = _textEditingController.text;
            if (text.toLowerCase() == "avada kedavra") {
              _counter = 0;
              _errorMessage = '';
            } else if (isNumeric(text)) {
              _counter += int.parse(text);
              _errorMessage = '';
            } else {
              _errorMessage = 'Error: Only numbers are accepted';
            }
            _textEditingController.clear();
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
