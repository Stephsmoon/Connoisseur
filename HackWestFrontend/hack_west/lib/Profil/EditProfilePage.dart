import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String currentName;
  final String currentProfilePictureUrl;
  final String currentEmail;

  const EditProfilePage({
    Key? key,
    required this.currentName,
    required this.currentProfilePictureUrl,
    required this.currentEmail,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late String _profilePictureUrl;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _emailController = TextEditingController(text: widget.currentEmail);
    _profilePictureUrl = widget.currentProfilePictureUrl;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // Function to handle profile picture change
  void _changeProfilePicture() {
    // Simulate changing profile picture URL
    setState(() {
      _profilePictureUrl = 'https://via.placeholder.com/150';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Profile Picture with Change Option
            GestureDetector(
              onTap: _changeProfilePicture,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(_profilePictureUrl),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _changeProfilePicture,
              child: const Text('Change Profile Picture'),
            ),
            const SizedBox(height: 20),
            // Name Input Field
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Save Button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'email': _emailController.text,
                  'name': _nameController.text,
                  'profilePictureUrl': _profilePictureUrl,
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
