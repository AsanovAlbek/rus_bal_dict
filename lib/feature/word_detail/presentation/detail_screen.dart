import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_bloc.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_event.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_bloc.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_event.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_state.dart';

import '../../../core/model/word.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (didPop) return;
              context.pop();
            },
            child: Column(
              children: [
                AppBar(
                  leading: IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  title: Text('${widget.word?.word}'),
                ),
                const SizedBox(height: 12),
                if (widget.word?.audioUrl.trim().isNotEmpty ?? false)
                  BlocProvider(
                    create: (context) =>
                        DetailBloc(GetIt.I<DetailRepository>())..add(GetAudioEvent(widget.word?.audioUrl)),
                    child: BlocBuilder<DetailBloc, DetailState>(
                      builder: (context, state) {
                        return switch (state) {
                          DetailStateLoaded(bytes: final bytes) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton.outlined(
                                    onPressed: () => _playMusic(bytes: bytes, speed: _normalSpeed),
                                    icon: Icon(_iconData)),
                                IconButton.outlined(
                                    onPressed: () => _playMusic(bytes: bytes, speed: _slowSpeed),
                                    icon: Row(
                                      children: [
                                        const Text('Медленно'),
                                        Icon(_iconData),
                                      ],
                                    ))
                              ],
                            ),
                          DetailStateError(exception: final exception) => Center(child: Text('$exception')),
                          DetailStateLoading() => const Center(child: CircularProgressIndicator()),
                        };
                      },
                    ),
                  ),
                const SizedBox(height: 12),
                Expanded(
                    child:
                        SingleChildScrollView(scrollDirection: Axis.vertical, child: Text("${widget.word?.meaning}")))
              ],
            )),
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
  }
}
