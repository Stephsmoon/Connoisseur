import 'package:flutter/material.dart';
import 'EditProfilePage.dart'; // Import the EditProfilePage
import 'savedPage.dart';
import 'package:hack_west/News/listitem.dart';
import 'saveProfil.dart';

class ProfilPage extends StatefulWidget {


  const ProfilPage({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String _profileName = 'John Doe';
  String _profilePictureUrl = 'https://via.placeholder.com/150';

  // Function to navigate to EditProfilePage and update profile info
  void _editProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          currentEmail: Email,
          currentName: Name,
          currentProfilePictureUrl: _profilePictureUrl,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        Name = result['name'];
        Email = result['email'];
        _profilePictureUrl = result['profilePictureUrl'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 8, 0, 0),
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                // Profile Picture
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(_profilePictureUrl),
                ),
                const SizedBox(height: 20),
                // Profile Name
                Text(
                  Name, // Updated User's name
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 5),
                // Profile Email
                Text(
                  Email, // User's email
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 20),
                // Edit Profile Button
                GestureDetector(
                  onTap: _editProfile, // Navigate to edit profile
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.purple, Colors.pinkAccent],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.favorite, color: Colors.pinkAccent),
                      title: const Text('Saved Articles'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Savedpage(), // Navigating to SavedPage
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.redAccent),
                      title: const Text('Logout',
                          style: TextStyle(color: Colors.redAccent)),
                      onTap: () {
                        // Handle logout
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
