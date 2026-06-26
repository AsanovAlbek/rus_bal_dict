import 'dart:async';

import 'package:rus_bal_dict/core/env/app_flavor.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.read<AuthBloc>().add(StartSessionEvent(
          onSuccess: () => context.go('/word_list'),
          onError: ([message]) => context.go('/auth')));
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      body: Center(
        child: Text(AppFlavor.greeting, style: textStyle),
      ),
    );
  }
}
