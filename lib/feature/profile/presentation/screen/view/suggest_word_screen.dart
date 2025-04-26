import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/presentation/auth.dart';
import 'package:rus_bal_dict/feature/profile/domain/bloc/suggest_bloc.dart';
import 'package:rus_bal_dict/feature/profile/domain/bloc/suggest_event.dart';
import 'package:rus_bal_dict/feature/profile/domain/bloc/suggest_state.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/new_suggest_repository.dart';
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
    return BlocProvider<SuggestBloc>(
      create: (context) => SuggestBloc(
        GetIt.I<NewSuggestRepository>(),
        logger: GetIt.I<Talker>()),
      child: CustomScrollView(
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
                  BlocBuilder<SuggestBloc, SuggestState>(
                    builder: (buildContext, state) {
                      return ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              var event = SuggestWordEvent(
                                wordController.text.trim(),
                                meaningController.text.trim(),
                                onSuccess: (message) {
                                  if (message != null) {
                                    context.showSnackBar(
                                      'Слово отправлено на рассмотрение',
                                    );
                                  }
                                },
                                onError: () {
                                  context.showSnackBar(
                                    'Произошла ошибка, повторите попытку позднее',
                                  );
                                },
                              );
                              buildContext.read<SuggestBloc>().add(event);
                            }
                          },
                          child: const Text('Предложить слово'));
                    }
                  ),
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
      ),
    );
  }
}
