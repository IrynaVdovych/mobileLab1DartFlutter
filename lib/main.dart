import 'package:flutter/material.dart';
import 'package:lab2/registration_screen.dart';
import 'package:lab2/profile_screen.dart';
import 'package:lab2/home_screen.dart';
import 'package:lab2/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Моя програма',
      theme: ThemeData(
        primaryColor: Colors.purple.shade200,
      ),
      initialRoute: '/', // початковий маршрут
      routes: {
        '/': (context) => MyHomePage(),
        '/registration': (context) => RegistrationWidget(), // використовуємо RegistrationWidget замість RegistrationScreen
        '/profile': (context) => ProfileScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text('About us'),
      ),
      body: Center(
        child: Text(
          'Task Manager',
        ),
      ),
      drawer: DrawerMain(selected: 'about'),
    );
  }
}

class DrawerMain extends StatefulWidget {
  DrawerMain({Key? key, required this.selected}) : super(key: key);

  final String selected;

  @override
  DrawerMainState createState() => DrawerMainState();
}

class DrawerMainState extends State<DrawerMain> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'TASK MANAGER',
              style: TextStyle(
                color: Colors.limeAccent.shade100,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.purple.shade200,
            ),
          ),
          ListTile(
            selected: widget.selected == 'about',
            leading: Icon(Icons.info),
            title: Text('About us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            selected: widget.selected == 'registration',
            leading: Icon(Icons.person_add),
            title: Text('Registration'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/registration');
            },
          ),
          ListTile(
            selected: widget.selected == 'profile',
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            selected: widget.selected == 'home', // встановлюємо активний елемент для HomeScreen
            leading: Icon(Icons.home),
            title: Text('Home Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home'); // переходимо на екран HomeScreen
            },
          ),
          ListTile(
            selected: widget.selected == 'login', // встановлюємо активний елемент для LoginScreen
            leading: Icon(Icons.login),
            title: Text('LogIn'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login'); // переходимо на екран LoginScreen
            },
          ),
        ],
      ),
    );
  }
}
