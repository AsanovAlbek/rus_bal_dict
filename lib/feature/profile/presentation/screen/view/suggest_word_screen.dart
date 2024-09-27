import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/presentation/auth.dart';
import 'package:talker/talker.dart';

class SuggestWordScreen extends StatefulWidget {
  const SuggestWordScreen({super.key});

  @override
  State<SuggestWordScreen> createState() => _SuggestWordScreenState();
}

class _SuggestWordScreenState extends State<SuggestWordScreen> {
  final wordController = TextEditingController();
  final meaningController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const MyAppBar(title: 'Предложить слово'),
        SliverPadding(
          padding: const EdgeInsets.all(12),
          sliver: SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: wordController,
                    decoration: const InputDecoration(
                      labelText: 'Слово',
                      border: OutlineInputBorder(),
                    ),
                    validator: (text) => text?.isNotEmpty ?? false
                        ? null
                        : 'Это поле обязательно для заполнения',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: meaningController,
                  decoration: const InputDecoration(
                    labelText: 'Значение слова',
                    border: OutlineInputBorder(),
                  ),
                  minLines: 3,
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final userId = context
                          .read<ProfileCubit>()
                          .state
                          .appSettings
                          .userInfo
                          .id;
                      if (userId case final userId?) {
                        if (formKey.currentState?.validate() ?? false) {
                          suggestWord(
                              SuggestWord(
                                  id: 0,
                                  word: wordController.text.trim(),
                                  meaning: meaningController.text.trim(),
                                  userId: userId), onSuccess: () {
                            context.showSnackBar(
                                'Слово отправлено на рассмотрение');
                          }, onError: (error) {
                            context.showSnackBar(
                                'Произошла ошибка, повторите попытку позднее');
                          });
                        }
                      }
                    },
                    child: const Text('Предложить слово')),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                    'Поле "Значение слова" не обязательно для заполнения, наши специалисты подберут для него значение')
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> suggestWord(SuggestWord word,
      {Function()? onSuccess, Function(Object?)? onError}) async {
    final dio = GetIt.I<Dio>( instanceName: dioWithBaseUrlInstanceName);
    final logger = GetIt.I<Talker>();
    try {
      await dio.post('suggest_word/', data: word.toJson());
      logger.debug('suggest success');
      onSuccess?.call();
    } catch (e, s) {
      logger.handle(e, s, 'suggest error');
      onError?.call(e);
    }
  }
}
