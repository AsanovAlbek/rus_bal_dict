import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';
import 'package:talker/talker.dart';

class ActivateAccountButton extends StatelessWidget {
  const ActivateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, bool>(
        selector: (authState) => authState.user?.isActive ?? false,
        builder: (context, isUserActive) {
          GetIt.I<Talker>().debug("User active = $isUserActive");
          return Visibility(
              visible: !isUserActive,
              child: ListTile(
                title: Center(
                    child: Text(
                  'Активируйте свой аккаунт',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.deepPurple),
                )),
                onTap: () => context.go('/profile/activate'),
              ));
        });
  }
}
