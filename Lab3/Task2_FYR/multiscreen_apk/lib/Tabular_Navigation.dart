import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'profile.dart';
import 'settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TabularNavigationApp(),
    );
  }
}

class TabularNavigationApp extends StatefulWidget {
  const TabularNavigationApp({super.key});

  @override
  _TabularNavigationAppState createState() => _TabularNavigationAppState();
}

class _TabularNavigationAppState extends State<TabularNavigationApp>
    with SingleTickerProviderStateMixin {
  final List<Widget> _tabs = [
    const Tab(text: 'Home'),
    const Tab(text: 'Profile'),
    const Tab(text: 'Settings'),
  ];

  final List<Widget> _tabViews = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
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
        title: const Text('Tabular Navigation App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/home');
                break;
              case 1:
                Navigator.pushNamed(context, '/profile');
                break;
              case 2:
                Navigator.pushNamed(context, '/settings');
                break;
            }
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabViews,
      ),
    );
  }
}
