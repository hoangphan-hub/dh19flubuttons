import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buttons'),
          backgroundColor: Colors.teal[300],
        ),
        body: DemoElevatedButton(),
      ),
    );
  }
}

class DemoElevatedButton extends StatefulWidget {
  const DemoElevatedButton({Key? key}) : super(key: key);

  @override
  _DemoElevatedButtonState createState() => _DemoElevatedButtonState();
}

class _DemoElevatedButtonState extends State<DemoElevatedButton> {
  String _text = 'Change me';
  double _volume = 0;

  void update() {
    setState(() {
      _text = 'Button tapped';
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _elevatedBtnStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(
        fontSize: 30,
      ),
      padding: EdgeInsets.all(20),
      primary: Colors.teal[500],
      onPrimary: Colors.black,
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _text,
            style: TextStyle(fontSize: 50),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text('Disabled'),
            style: _elevatedBtnStyle,
          ),
          ElevatedButton(
            onPressed: () => update(),
            child: Text('Enabled'),
            style: _elevatedBtnStyle,
          ),
          TextButton(
            onPressed: null,
            child: Text('Disabled'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 30),
            ),
          ),
          TextButton(
            onPressed: () => update(),
            child: Text('Enabled'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 30),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF8B5CF6),
                          Color(0xFFC4B5FD),
                          Color(0xFFEDE9FE)
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => update(),
                  child: Text('Gradient'),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30),
                    primary: Colors.black,
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _volume -= 10;
                _text = 'Volume: $_volume ...';
              });
            },
            icon: Icon(
              Icons.volume_down,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
