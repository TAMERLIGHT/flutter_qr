import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/auth_bloc_bloc.dart';
import 'package:flutter_application_1/profile_info_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  final usernameValidator = RegExp(r'^[a-zA-Zа-яА-Я]*$');
  final emailValidator = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  late AuthBlocBloc authBloc;

  @override
  void initState() {
    authBloc = AuthBlocBloc();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Регистрация"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              buildAuthBlocListener(),
              buildTextFormFiled(),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAuthBlocListener() {
    return BlocConsumer(
      bloc: authBloc,
      listener: (context, state) {
        if (state is LoadedAuthState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileInfoPage()));
        }
        if (state is FailureLoginState) {
          const errorMessage = "Ошибка подключения к БД";
          showError(context, errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LoadingAuthState) {
          return Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.2),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildTextFormFiled() {
    return Column(
      children: [
        TextField(
          controller: usernameController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.login_rounded),
            hintText: "Введите логин",
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.email),
            hintText: "Введите email",
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: () {
        String username = usernameController.text;
        String email = emailController.text;

        if (usernameValidator.hasMatch(username) && emailValidator.hasMatch(email)) {
          authBloc.add(GetAuthEvent(username, email));
        } else {
          const errorMessage = "Неверный формат имени пользователя или email";
          showError(context, errorMessage);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
      ),
      child: const Text("Зарегистрировать"),
    );
  }

  void showError(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Ошибка"),
          content: Text(errorMessage),
          actions: <Widget>[
            OutlinedButton(
              child: const Text("Закрыть"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
