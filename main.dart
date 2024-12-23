import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainAppPage(),
    );
  }
}

class MainAppPage extends StatefulWidget {
  const MainAppPage({super.key});

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MessagingPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My App"),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messaging",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CustomSearchBar(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFeatureWidget(
              context,
              icon: Icons.directions_car,
              label: "Transport",
              description: "Transport functionality not implemented yet.",
            ),
            _buildFeatureWidget(
              context,
              icon: Icons.account_balance_wallet,
              label: "Wallet",
              description: "Wallet functionality not implemented yet.",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureWidget(BuildContext context,
      {required IconData icon,
      required String label,
      required String description}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(label),
                content: Text(description),
              ),
            );
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green.withOpacity(0.1),
            child: Icon(icon, size: 30, color: Colors.green),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: Colors.black54),
            onPressed: () {},
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search the Grab app",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class MessagingPage extends StatelessWidget {
  const MessagingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.message,
            size: 100,
            color: Colors.green,
          ),
          const SizedBox(height: 20),
          const Text(
            "Messaging Page",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            "Here you can chat with your contacts.",
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("Start Chat"),
                  content: Text("Chat functionality not implemented yet."),
                ),
              );
            },
            child: const Text("Start a Chat"),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person,
            size: 100,
            color: Colors.green,
          ),
          const SizedBox(height: 20),
          const Text(
            "Profile Page",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            "View and edit your profile information here.",
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Edit Profile"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Name",
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Save"),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Edit Profile"),
          ),
        ],
      ),
    );
  }
}

