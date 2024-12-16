import 'package:flutter/material.dart';
import 'package:swifty_companion/widgets/user_info.dart';
import '../models/user.dart';
import 'package:swifty_companion/widgets/tabs/projects_tab.dart';
import 'package:swifty_companion/widgets/tabs/skills_tab.dart';

class UserPage extends StatefulWidget {
  final User user;

  const UserPage({super.key, required this.user});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back to search', style: TextStyle(fontFamily: 'MotleyForces')),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/user_info_page/home2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
          ),
          Column(
            children: [
              UserInfo(user: widget.user),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 159, 199, 232).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SkillsTab(user: widget.user),
                      ProjectsTab(user: widget.user),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BottomAppBar(
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  icon: Image.asset(
                    'assets/icons/skills.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/icons/projects.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
        ),
      ),
    );
  }
}