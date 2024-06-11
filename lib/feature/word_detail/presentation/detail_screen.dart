import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rus_bal_dict/core/hive/favorite_word/favorite_word_hive_model.dart';
import 'package:rus_bal_dict/core/hive/word/converter.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/feature/favorites/data/converter.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_bloc.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_event.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_state.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_bloc.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_event.dart';
import 'package:rus_bal_dict/feature/profile/domain/cubit/profile_cubit.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_bloc.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_event.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_state.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_bloc.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_event.dart';
import 'package:talker/talker.dart';

import '../../../core/model/word/word.dart';
import '../domain/repository/detail_repository.dart';

const double _normalSpeed = 1.0;
const double _slowSpeed = 0.5;

class WordsDetailScreen extends StatefulWidget {
  final Word? word;

  const WordsDetailScreen({super.key, this.word});

  @override
  State<WordsDetailScreen> createState() => _WordsDetailScreenState();
}

class _WordsDetailScreenState extends State<WordsDetailScreen> {
  final AudioPlayer player = GetIt.I<AudioPlayer>();
  late final StreamSubscription<PlayerState> _playerStateListener;
  IconData _iconData = Icons.play_arrow;

  @override
  void initState() {
    _playerStateListener = player.onPlayerStateChanged.listen((state) {
      setState(() {
        _iconData = state == PlayerState.playing ? Icons.pause : Icons.play_arrow;
      });
    });
    if (mounted && widget.word != null) {
      context.read<HistoryBloc>().add(HistoryEvent.addToHistory(word: widget.word!));
    }
    super.initState();
  }

  @override
  void dispose() {
    _playerStateListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          context.pop();
        },
        child: ValueListenableBuilder(
          valueListenable: Hive.box<FavoriteWordHiveModel>('favorites').listenable(),
          builder: (BuildContext context, Box<FavoriteWordHiveModel> value, Widget? child) {
            return BlocProvider(
              create: (context) =>
              DetailBloc(GetIt.I<DetailRepository>())..add(GetAudioEvent(widget.word?.audioUrl)),
              child: BlocBuilder<DetailBloc, DetailState>(
                builder: (context, state) {
                  final favoritesState = context.read<FavoritesBloc>().state;
                  if (favoritesState is FavoritesStateLoaded) {
                    context
                        .read<DetailBloc>()
                        .add(ChangeFavoriteEvent(favoritesState.favorites.contains(widget.word)));
                  }
                  return switch (state) {
                    DetailStateLoaded(bytes: final bytes, isFavorite: final isFavorite) =>
                        CustomScrollView(controller: ScrollController(), slivers: [
                          MyAppBar(
                            title: widget.word?.word.toCapitalized() ?? '',
                            actions: [
                              IconButton(
                                  onPressed: () => _playMusic(bytes: state.bytes),
                                  icon: const Icon(Icons.play_arrow)),
                              IconButton(
                                  onPressed: () {
                                    if (widget.word != null) {
                                      int wordId = widget.word?.id ?? 0;
                                      if (value.containsKey(wordId)) {
                                        value.delete(wordId);
                                      } else {
                                        int userId = context.read<ProfileCubit>().state.appSettings.userInfo.id ?? 0;
                                        value.put(wordId, widget.word!.toFavoritesHive(userId: userId));
                                      }
                                      //context.read<WordsListBloc>().add(WordsListEvent.fetch());
                                    }
                                  },
                                  icon: Icon(
                                    Icons.star,
                                    color: Hive.box<FavoriteWordHiveModel>('favorites')
                                        .containsKey(widget.word?.id ?? 0)
                                        ? Colors.yellow
                                        : Colors.grey,
                                  ))
                            ],
                          ),
                          const SizedBox(height: 12).asSliver,
                          SliverPadding(
                              padding: const EdgeInsets.all(12),
                              sliver: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${widget.word?.meaning.toCapitalized()}"),
                                  )).asSliver)
                        ]),
                    DetailStateError(exception: final exception) => Center(child: Text('$exception')),
                    DetailStateLoading() => const Center(child: CircularProgressIndicator()),
                  };
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _playMusic({Uint8List? bytes, double speed = _normalSpeed}) {
    Source? audioSource;
    if (bytes != null) {
      audioSource = BytesSource(bytes);
    }
    if (audioSource != null) {
      if (player.state == PlayerState.playing) {
        player.stop();
      } else {
        player.setPlaybackRate(speed);
        player.setSource(audioSource);
        player.play(audioSource);
      }
    }
    Talker().debug('bytes = $bytes source = $audioSource');
  }
}
