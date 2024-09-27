import 'package:flutter/material.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:talker/talker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String amount;
  final String email;
  final Uri? paymentUri;
  const PaymentScreen(
      {super.key,
      required this.amount,
      required this.email,
      required this.paymentUri});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController controller;
  final Talker talker = Talker();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(widget.paymentUri!)
      ..addJavaScriptChannel('PaymentChannel', onMessageReceived: (JavaScriptMessage message) {
        Talker().debug('message from webview ${message.message}');
      })..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          talker.info('onNavigationRequest ${request.url}');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String pageStartMessage) {
          talker.info('onPageStarted $pageStartMessage');
        },
        onPageFinished: (String pageFinishMessage) async {
          talker.info('onPageFinished $pageFinishMessage');
          if (pageFinishMessage.contains('success')) {
            talker.info('Press pay button');
            Future.sync(() {
              context.read<ProfileCubit>().confirmPayment();
            });
          }
        },
        onProgress: (int progress) {
          talker.info('onProgress $progress');
        },
        onUrlChange: (UrlChange urlChange) {
          talker.info('onUrlChange ${urlChange.url}');
        },
      ));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const MyAppBar(title: 'Оплата подписки'),
        SliverFillRemaining(child: WebViewWidget(controller: controller))
      ],
    );
  }
}
