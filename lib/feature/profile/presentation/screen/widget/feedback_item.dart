import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedbackItem extends StatelessWidget {
  final Icon? icon;
  final String title;
  final String subtitle;
  final String? email;
  final String? contactPhoneNumber;
  const FeedbackItem(
      {super.key,
      this.icon,
      required this.title,
      this.email,
      this.contactPhoneNumber,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: icon ?? const Icon(Icons.person, color: Colors.grey),
          title: Text(title),
          subtitle: Column(
            children: [
              Text(subtitle),
              const SizedBox(
                height: 8,
              ),
              if (email != null)
                ListTile(
                  title: Text(email!),
                  leading: const Icon(Icons.email_outlined, color: Colors.grey),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy, color: Colors.grey),
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: email!));
                      Future.sync(() => ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              content:
                                  Text('Почта скопирована в буфер обмена'))));
                    },
                  ),
                ),
              if (contactPhoneNumber != null)
                ListTile(
                  title: Text(contactPhoneNumber!),
                  leading: const Icon(Icons.contact_page_outlined, color: Colors.grey),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy, color: Colors.grey),
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: contactPhoneNumber!));
                      Future.sync(() => ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              content:
                                  Text('Номер телефона скопирован в буфер обмена'))));
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
