import 'dart:async';

class AppUtils {
  static Timer? _timer;
  static void debounce(Function action, [Duration duration = const Duration(milliseconds:500)]) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(duration, () => action());
  }
}