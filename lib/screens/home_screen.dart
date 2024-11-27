import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_latihan/screens/about_screen.dart';
import 'package:flutter_latihan/screens/counter_screen.dart';
import 'package:flutter_latihan/screens/counter_screen_without_provider.dart';
import 'package:flutter_latihan/screens/Sushi_ RaihanNurulAlam/welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter By Raihan Nurul Alam'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        children: [
          // Anonymous Route
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              title: Text('Anonymous Route'),
              trailing: Icon(CupertinoIcons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const AboutScreen(title: 'About Screen'),
                  ),
                );
              },
            ),
          ),

          // Named Route
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              title: Text('Named Route'),
              trailing: Icon(CupertinoIcons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ),

          // Emoji Generator
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              title: Text('Emoji Generator'),
              trailing: Icon(CupertinoIcons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, '/emojiGenerator', arguments: {
                  'length': 3,
                });
              },
            ),
          ),

          // Counter App with Provider
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              title: Text('Counter App with Provider'),
              trailing: Icon(CupertinoIcons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterScreen()),
                );
              },
            ),
          ),

          // Counter App not using Provider
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              title: Text('Counter App without Provider'),
              trailing: Icon(CupertinoIcons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CounterScreenWithoutProvider()),
                );
              },
            ),
          ),

          // Sushi App
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              title: Text('Sushi App'),
              trailing: Icon(CupertinoIcons.arrow_right),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Wrap(
          children: const [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Build With Flutter',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 6),
                  FlutterLogo(
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
