import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rus_bal_dict/core/utils/interceptiors.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:talker/talker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String amount;
  final String email;
  const PaymentScreen({super.key, required this.amount, required this.email});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _makePayment(),
        builder: (context, _) {
          return CustomScrollView(
            slivers: [
              const MyAppBar(title: 'Оплата подписки'),
              SliverFillRemaining(
                child: WebViewWidget(controller: controller),
              )
            ],
          );
        });
  }

  Future<void> _makePayment() async {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: false));
    dio.interceptors.add(RedirectInterceptor(dio));

    var data = {
      'amount': widget.amount,
      'order_id': Random().nextInt(99999),
      'email': widget.email,
    };

    try {
      final paymentResponse = await dio.post(
          'http://files.howtosayve.com/payment_balk.php',
          data: FormData.fromMap(data),
          options: Options(
              validateStatus: (status) => status != null && status < 500));
      controller.loadRequest(paymentResponse.realUri);
    } catch (e, s) {
      Talker().handle(e, s, 'Ошибка перевода');
    }
  }
}
