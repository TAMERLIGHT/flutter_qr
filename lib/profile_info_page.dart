import 'package:flutter/material.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Пользователь зарегистрирован"),
        ),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: const Text("Регистрация прошла успешно!"),
        ),
      ),
    );
  }
}
