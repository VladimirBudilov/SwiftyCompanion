import 'package:flutter/material.dart';
import '../models/user.dart';

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: isLandscape
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildImageSection(),
                const SizedBox(height: 16),
                _buildInfoSection(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildImageSection(),
                const SizedBox(width: 16),
                Expanded(child: _buildInfoSection()),
              ],
            ),
    );
  }

  Widget _buildImageSection() {
    const double imageSize = 250.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: imageSize - 100,
          height: imageSize - 100,
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
          width: imageSize,
          height: imageSize,
          child: Image.asset(
            'assets/frame.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          user.login,
          style: const TextStyle(
            fontFamily: 'MotleyForces',
            fontSize: 18,
          ),
        ),
        Text(
          user.fullName,
          style: const TextStyle(
            fontFamily: 'MotleyForces',
            fontSize: 18,
          ),
        ),
        Text(
          'Level: ${user.level.toStringAsFixed(2)}',
          style: const TextStyle(
            fontFamily: 'MotleyForces',
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Wallet: ${user.wallet}',
          style: const TextStyle(
            fontFamily: 'MotleyForces',
            fontSize: 18,
          ),
        ),
        if (user.campus != null) ...[
          Text(
            user.campus!.name,
            style: const TextStyle(
              fontFamily: 'MotleyForces',
              fontSize: 18,
            ),
          ),
        ],
      ],
    );
  }
}
