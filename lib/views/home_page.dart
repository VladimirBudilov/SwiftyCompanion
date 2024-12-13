// lib/views/home_page.dart

import 'package:flutter/material.dart';

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

    // Mock API call (replace with actual service later)
    await Future.delayed(const Duration(seconds: 2));

    final username = _controller.text;

    if (username.isEmpty) {
      setState(() {
        _error = 'Please enter a username';
        _isLoading = false;
      });
      return;
    }

    // Simulating a response
    final isValidUser = username == "valid_user"; // Replace with API logic

    setState(() {
      _isLoading = false;
      if (!isValidUser) {
        _error = 'User not found';
      } else {
        // Navigate to the next page
        Navigator.pushNamed(context, '/user');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Search'),
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
                labelText: 'Enter Username',
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
