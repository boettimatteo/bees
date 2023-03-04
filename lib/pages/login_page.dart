import 'package:bees/injector/injector.dart';
import 'package:bees/repository/user_repository.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await getIt.get<UserRepository>().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                    Navigator.maybeOf(context)
                        ?.pushReplacementNamed("homepage");
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                  }
                },
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
