import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_bloc.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_event.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_bloc.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_event.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_state.dart';
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
        child: BlocProvider(
          create: (context) =>
          DetailBloc(GetIt.I<DetailRepository>())
            ..add(GetAudioEvent(widget.word?.audioUrl)),
          child: BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              return switch (state) {
                DetailStateLoaded(bytes: final bytes) =>
                    CustomScrollView(
                        controller: ScrollController(),
                        slivers: [
                          MyAppBar(
                            title: widget.word?.word.toCapitalized() ?? '',
                            actions: [
                              IconButton(
                                  onPressed: () => _playMusic(bytes: state.bytes),
                                  icon: const Icon(Icons.play_arrow))
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
                        ]
                    ),
                DetailStateError(exception: final exception) =>
                    Center(child: Text('$exception')),
                DetailStateLoading() => const Center(child: CircularProgressIndicator()),
              };
            },
          ),
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
