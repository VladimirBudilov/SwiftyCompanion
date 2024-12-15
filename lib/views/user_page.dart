import 'package:flutter/material.dart';
import 'package:swifty_companion/widgets/user_info.dart';
import '../models/user.dart';
import 'package:swifty_companion/widgets/tabs/projects_tab.dart';
import 'package:swifty_companion/widgets/tabs/skills_tab.dart';

class UserPage extends StatefulWidget {
  final User user;

  UserPage({required this.user});

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
        title: Text('User Info'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: UserInfo(user: widget.user),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SkillsTab(user: widget.user),
                ProjectsTab(user: widget.user),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
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
    );
  }
}