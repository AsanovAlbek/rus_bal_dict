import 'package:rus_bal_dict/export.dart';

class SliderTransitionPage extends CustomTransitionPage {
  SliderTransitionPage({super.key, required super.child})
      : super(
          transitionDuration: Durations.medium3,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var end = Offset.zero;
            var begin = const Offset(1.5, 0.0);
            var curveTween = CurveTween(curve: Curves.easeInCirc);
            var tween = Tween(begin: begin, end: end).chain(curveTween);
            return SlideTransition(
                position: animation.drive(tween), child: child);
          },
        );
}
