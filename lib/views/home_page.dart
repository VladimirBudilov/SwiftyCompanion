import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swifty_companion/services/user_service.dart';
import 'user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
        _error = 'Please enter a username';
        _isLoading = false;
      });
      return;
    }

    final userService = Provider.of<UserService>(context, listen: false);
    final user = await userService.getUserByLogin(username);

    setState(() {
      _isLoading = false;
      if (user == null) {
        _error = 'User not found';
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserPage(user: user),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose peer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter login',
                errorText: _error,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _searchUser,
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}