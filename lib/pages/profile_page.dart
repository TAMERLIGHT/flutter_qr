import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String? userProfileName;
  final String? userProfileEmail;

  const ProfilePage({Key? key, this.userProfileName, this.userProfileEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Имя пользователя: ${userProfileName ?? 'Не указано'}"),
            Text("Email: ${userProfileEmail ?? 'Не указано'}"),
          ],
        ),
      ),
    );
  }
}
