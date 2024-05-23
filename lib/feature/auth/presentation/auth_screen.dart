import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: GestureDetector(onTap: () {
      context.push('/word_list');
    },child: const Text('Auth'))));
  }

}