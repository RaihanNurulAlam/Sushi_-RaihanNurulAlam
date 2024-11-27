import 'dart:math';

import 'package:flutter/material.dart';

class EmojiGenerator extends StatefulWidget {
  const EmojiGenerator({super.key});

  @override
  State<EmojiGenerator> createState() => _EmojiGeneratorState();
}

class _EmojiGeneratorState extends State<EmojiGenerator> {
  final Random _random = Random();
  final List<String> _emojiList = [
    '😀',
    '😂',
    '🥰',
    '😎',
    '🤔',
    '😭',
    '🎉',
    '🌟',
    '🔥',
    '🍕'
  ];

  List<String> _randomEmojis = [];

  int length = 0;

  getArgs() {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    setState(() {
      length = arguments['length'];
    });
    _generateRandomEmojis(length);
  }

  void _generateRandomEmojis(int lng) {
    setState(() {
      _randomEmojis = List.generate(
          lng, (index) => _emojiList[_random.nextInt(_emojiList.length)]);
    });
  }

  @override
  void initState() {
    // getArgs();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      getArgs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emoji Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: _randomEmojis
                  .map(
                    (emoji) => Text(
                      emoji,
                      style: TextStyle(fontSize: 120),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _generateRandomEmojis(length);
              },
              child: Text(
                'Generate Random Emoji',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
