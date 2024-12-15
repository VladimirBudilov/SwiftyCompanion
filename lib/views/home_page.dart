import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/models/user.dart';
import 'package:swifty_companion/services/user_service.dart';
import 'package:swifty_companion/views/user_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  String? _error;

  void _searchUser() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final username = _controller.text;

    if (username.isEmpty) {
      setState(() {
        _error = 'Enter login';
        _isLoading = false;
      });
      return;
    }

    final userService = Provider.of<UserService>(context, listen: false);
    try {
      final user = await userService.getUserByLogin(username);
      setState(() {
        _isLoading = false;
      });
      if (user == null) {
        setState(() {
          _error = 'User not found';
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserPage(user: user),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/login_page/login5.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  SizedBox(
                    width: screenWidth / 2,
                    child: TextField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'ChristmasStories',
                        fontSize: 34,
                      ),
                      decoration: InputDecoration(
                        label: Center(
                          child: Text(
                            'Enter login',
                            style: TextStyle(
                              fontFamily: 'ChristmasStories',
                              fontSize: 34,
                            ),
                          ),
                        ),
                        labelStyle: TextStyle(
                          fontFamily: 'ChristmasStories',
                          fontSize: 34,
                        ),
                        errorText: _error,
                        errorStyle: TextStyle(
                          color: const Color.fromARGB(255, 243, 71, 128),
                          fontFamily: 'ChristmasStories',
                          fontSize: 26,
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: screenWidth / 3,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _searchUser,
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Search',
                              style: TextStyle(
                                fontFamily: 'MotleyForces',
                                fontSize: 30,
                                color: const Color.fromARGB(255, 102, 174, 241),
                              ),
                            ),
                    ),
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
