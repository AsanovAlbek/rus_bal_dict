import 'package:flutter/gestures.dart';

import '../auth.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget(
      {super.key, required this.authFormKey, required this.onSignUp});
  final GlobalKey<FormState> authFormKey;
  final Function(BuildContext context, bool? isValid) onSignUp;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late final TapGestureRecognizer textTapRecognizer;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      textTapRecognizer = TapGestureRecognizer()
        ..onTap = () => context.go('/auth/privacy');
    }
  }

  @override
  void dispose() {
    super.dispose();
    textTapRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bodySmallStyle = Theme.of(context).textTheme.bodySmall;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => widget.onSignUp(
                  context, widget.authFormKey.currentState?.validate()),
              child: const Text('Продолжить')),
        ),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 8,
        ),
        TextButton(
          onPressed: () {
            widget.authFormKey.currentState?.reset();
            FocusManager.instance.primaryFocus?.unfocus();
            context
                .read<AuthBloc>()
                .add(AuthEvent.changeAuthPage(pageState: AuthPageState.signIn));
          },
          child: const Text('Назад'),
        ),
      ],
    );
  }
}
