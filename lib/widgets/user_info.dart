import 'package:flutter/material.dart';
import 'package:swifty_companion/widgets/clickable_text.dart';
import '../models/user.dart';

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final userInfoHeight = screenHeight / 3;

    return Container(
      height: userInfoHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Center items vertically
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: userInfoHeight / 2 - 20,
                height: userInfoHeight / 2 - 20,
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    user.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: userInfoHeight / 1.5,
                height: userInfoHeight / 1.5,
                child: Image.asset(
                  'assets/frame.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.login,
                  style: TextStyle(
                    fontFamily: 'MotleyForces',
                    fontSize: 18,
                  ),
                ),
                Text(
                  user.fullName,
                  style: TextStyle(
                    fontFamily: 'MotleyForces',
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Level: ${user.level.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontFamily: 'MotleyForces',
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Wallet: ${user.wallet}',
                  style: TextStyle(
                    fontFamily: 'MotleyForces',
                    fontSize: 18,
                  ),
                ),
                if (user.campus != null) ...[
                  Text(
                    user.campus!.name,
                    style: TextStyle(
                      fontFamily: 'MotleyForces',
                      fontSize: 18,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}