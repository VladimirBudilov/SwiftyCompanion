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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  user.imageUrl,
                  width: userInfoHeight / 2,
                  height: userInfoHeight / 2,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            user.email,
            style: TextStyle(
              fontFamily: 'MotleyForces',
              fontSize: 18,
            ),
          ),
          if (user.campus != null) ...[
            Text(
              '${user.campus!.name}, ${user.campus!.address}',
              style: TextStyle(
                fontFamily: 'MotleyForces',
                fontSize: 18,
              ),
            ),
          ],
        ],
      ),
    );
  }
}