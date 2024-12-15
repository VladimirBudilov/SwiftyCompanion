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
        title: const Text('User Info'),
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
            decoration: BoxDecoration(
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
              tabs: const [
                Tab(icon: Icon(Icons.school), text: 'Skills'),
                Tab(icon: Icon(Icons.work), text: 'Projects'),
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